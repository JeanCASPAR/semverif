// Vérifie que les paramètres
// sont pas réécrits si la même fonction
// est utilisée comme sous-expression

int add(int x, int y) {
    return x + y;
}

void main() {
    int i = add(add(1, 2), add(3, 4));
    assert(i == 10);
}
