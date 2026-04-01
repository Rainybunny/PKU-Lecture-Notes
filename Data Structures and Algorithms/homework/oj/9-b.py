qword = input().strip()
occur = []

n = int(input())

qrank = int(input())
bucket = {}

for i in range(n):
    words = input().strip().split(' ')
    if qword in words: occur.append(i + 1)
    for w in words: bucket[w] = bucket.get(w, 0) + 1

len_ocr = len(occur)
if len_ocr == 0:
    print(-1)
else:
    for i in range(len_ocr):
        print(occur[i], end="\n "[i < len_ocr - 1])

order = sorted(bucket.items(), key=lambda x: -x[1])
print(order[qrank - 1][1])
