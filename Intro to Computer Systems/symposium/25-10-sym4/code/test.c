int foo(int x) {
    switch (x) {
        case 0:
            x = 114;
        case 1:
            x += 514;
            break;
        case 3:
        case 4:
            x = 1919;
            break;
        default:
            x = 810;
    }
    return x;
}

int bar(int x) {
    static const void* jmpt[] = { &&loc_0, &&loc_1, &&loc_def, &&loc_3_4, &&loc_3_4 };
    if (x > 4u) goto loc_def;
    goto *jmpt[x];
loc_0:
    x = 114;
loc_1:
    x += 514;
    goto done;
loc_3_4:
    x = 1919;
loc_def:
    x = 810;
done:
    return x;
}

