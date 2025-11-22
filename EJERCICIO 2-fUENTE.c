#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TAM 15

int suma_divisores_propios(int n) {
    int suma = 0;
    if (n <= 1) return 0;
    for (int i = 1; i <= n / 2; i++) {
        if (n % i == 0) {
            suma += i;
        }
    }
    return suma;
}

const char* clasificar(int n) {
    int suma = suma_divisores_propios(n);

    if (suma < n)  return "Deficiente";
    if (suma == n) return "Perfecto";
    return "Abundante";
}

int main() {
    int arreglo[TAM];

    /* 1. Inicializar generador aleatorio */
    srand(time(NULL));

    /* 2. Llenar arreglo con valores aleatorios (1 a 100) */
    for (int i = 0; i < TAM; i++) {
        arreglo[i] = rand() % 100 + 1;
    }

    /* 3. Imprimir el arreglo completo */
    printf("El arreglo es: ");
    for (int i = 0; i < TAM; i++) {
        if (i == TAM - 1)
            printf("%d\n", arreglo[i]);
        else
            printf("%d, ", arreglo[i]);
    }

    printf("\n");

    /* 4. Imprimir cada numero con su clasificacion */
    for (int i = 0; i < TAM; i++) {
        printf("%d - %s\n", arreglo[i], clasificar(arreglo[i]));
    }

    return 0;
}
