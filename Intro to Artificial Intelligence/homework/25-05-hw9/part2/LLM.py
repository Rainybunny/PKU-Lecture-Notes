import re
from Maze import Maze
from openai import OpenAI


# TODO: Replace this with your own prompt.
your_prompt = """
你是一位吃豆人游戏的高手，你将帮助用户进行吃豆人游戏中的行动决策。
在接下来的对话中，用户总会向你描述一个吃豆人游戏的状态，你需要严格按照输出格式要求给出一次动作和分析。
吃豆人的基本规则如下：
1. 吃豆人每次可以向上下左右中的一个方向移动一步，不能留在原地不动。（具体移动方向需要由你决定）；
2. 吃豆人不能移动到迷宫之外，不能移动到墙壁上，不能移动到鬼魂的位置。（你 **必须** 保证自己的移动符合要求）；
3. 吃豆人与某个豆子的位置重合时，就能吃掉这个豆子，吃掉所有豆子则获得胜利。（你需要通过豆子的坐标和吃豆人曾经经过的坐标来判断哪些豆子还没有被吃掉）。
你在做决策时，需要 **在遵守基本规则的前提下**，**最小化** 吃掉所有豆子所需的总步数。
*请注意*，用户给出的鬼魂位置不会变化，你可以认为鬼魂就是墙体，而不会主动追击吃豆人。**这与一般的吃豆人规则不同。**
"""

# Don't change this part.
output_format = """
输出必须是0-3的整数，上=0，下=1，左=2，右=3。
*重点*：(5,5)的上方是(4,5)，下方是(6,5)，左方是(5,4)，右方是(5,6)。
输出格式为：
“分析：XXXX。
动作：0（一个数字，不能出现其他数字）。”
"""

prompt = your_prompt + output_format


def get_game_state(maze: Maze, places: list, available: list) -> str:
    """
    Convert game state to natural language description.
    """
    description = ""
    for i in range(maze.height):
        for j in range(maze.width):
            description += f"({i},{j})="
            if maze.grid[i, j] == 0:
                description += f"空地"
            elif maze.grid[i, j] == 1:
                description += "墙壁"
            else:
                description += "豆子"
            description += ","
        description += "\n"
    places_str = ','.join(map(str, places))
    available_str = ','.join(map(str, available))
    state = f"""当前游戏状态（坐标均以0开始）：\n1、迷宫布局（0=空地,1=墙,2=豆子）：\n{description}\n2、吃豆人位置：{maze.pacman_pos[4]}\n3、鬼魂位置：{maze.pacman_pos[3]}\n4、曾经走过的位置：{places_str}\n5、可用方向：{available_str}\n"""
    return state


def get_ai_move(client: OpenAI, model_name: str, maze: Maze, file, places: list, available: list) -> int:
    """
    Get the move from the AI model.
    :param client: OpenAI client instance.
    :param model_name: Name of the AI model.
    :param maze: The maze object.
    :param file: The log file to write the output.
    :param places: The list of previous positions.
    :param available: The list of available directions.
    :return: The direction chosen by the AI.
    """
    state = get_game_state(maze, places, available)

    file.write("________________________________________________________\n")
    file.write(f"message:\n{state}\n")
    print("________________________________________________________")
    print(f"message:\n{state}")

    print("Waiting for AI response...")
    all_response = client.chat.completions.create(
        model=model_name,
        messages=[
            {
                "role": "system",
                "content": prompt
            },
            {
                "role": "user",
                "content": state
            }
        ],
        stream=False,
        temperature=.0
    )
    info = all_response.choices[0].message.content

    file.write(f"AI response:\n{info}\n")
    print(f"AI response:\n{info}")
    numbers = re.findall(r'\d+', info)
    choice = numbers[-1]
    return int(choice), info
