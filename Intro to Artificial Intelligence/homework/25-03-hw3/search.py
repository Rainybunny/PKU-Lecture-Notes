# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util
import heapq

class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()


def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

def depthFirstSearch(problem: SearchProblem):
    """
    Search the deepest nodes in the search tree first.

    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.

    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:

    print("Start:", problem.getStartState())
    print("Is the start a goal?", problem.isGoalState(problem.getStartState()))
    print("Start's successors:", problem.getSuccessors(problem.getStartState()))
    """

    vis = set()

    def dfs(s):
        vis.add(s)
        if problem.isGoalState(s): return True, []
        for ns, mv, ds in problem.getSuccessors(s):
            if not ns in vis:
                res, act = dfs(ns)
                if res:
                    act.append(mv)
                    return True, act
        return False, []

    res, act = dfs(problem.getStartState())
    assert res, "my error: dfs solution not fond"
    act.reverse()
    return act

def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""
    #python pacman.py -l mediumMaze -p SearchAgent -a fn=bfs --frameTime 0
    #python pacman.py -l bigMaze -p SearchAgent -a fn=bfs -z .5 --frameTime 0
    "*** YOUR CODE HERE ***"

    Frontier = util.Queue()
    Visited = []
    Frontier.push( (problem.getStartState(), []) )
    #print 'Start',problem.getStartState()
    Visited.append( problem.getStartState() )

    while Frontier.isEmpty() == 0:
        state, actions = Frontier.pop()
        if problem.isGoalState(state):
            #print 'Find Goal'
            return actions 
        for next in problem.getSuccessors(state):
            n_state = next[0]
            n_direction = next[1]
            if n_state not in Visited:
                Frontier.push( (n_state, actions + [n_direction]) )
                Visited.append( n_state )

def uniformCostSearch(problem: SearchProblem):
    """Search the node of least total cost first."""

    vis = set()
    dis = dict()
    heap = util.PriorityQueue()
    star = problem.getStartState()
    goal = star # temp

    dis[star] = (0, star, ) # E is useless mark
    heap.push(problem.getStartState(), 0)
    while not heap.isEmpty():
        s = heap.pop()
        if problem.isGoalState(s): goal = s; break
        if s in vis: continue
        cur = dis[s][0]; vis.add(s)
        for ns, mv, w in problem.getSuccessors(s):
            if (not ns in dis) or (dis[ns][0] > cur + w):
                dis[ns] = cur + w, s, mv
                heap.push(ns, cur + w)

    assert problem.isGoalState(goal), "my error: ucs solution not found"

    def trace(s):
        if s == star: return []
        _, ps, mv = dis[s]
        bef = trace(ps); bef.append(mv)
        return bef

    return trace(goal)

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem, heuristic=nullHeuristic):
    """Search the node that has the lowest combined cost and heuristic first."""

    vis = set()
    dis = dict()
    heap = util.PriorityQueue()
    star = problem.getStartState()
    goal = star # temp

    def decorate(s):
        return s
        # if not isinstance(s, tuple) or not isinstance(s[1], list):
        #     return s
        # else: # only for tuple(tuple[int, int], list[int])
        #     return s[0], *s[1]

    dis[decorate(star)] = (0, star, )
    heap.push(star, heuristic(star, problem))
    while not heap.isEmpty():
        s = heap.pop(); tups = decorate(s)
        if problem.isGoalState(s): goal = s; break
        if tups in vis: continue
        cur = dis[tups][0]; vis.add(tups)
        for ns, mv, w in problem.getSuccessors(s):
            tupns = decorate(ns)
            if (not tupns in dis) or (dis[tupns][0] > cur + w):
                dis[tupns] = cur + w, s, mv
                heap.push(ns, cur + w + heuristic(ns, problem))

    assert problem.isGoalState(goal), "my error: astar solution not found"

    def trace(s):
        if s == star: return []
        _, ps, mv = dis[decorate(s)]
        bef = trace(ps); bef.append(mv)
        return bef

    return trace(goal)


# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
