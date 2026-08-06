package modelo;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class CalculadoraMetasTest {

    @Test
    public void pruebaCumplimiento() {

        CalculadoraMetas calculadora = new CalculadoraMetas();

        double resultado = calculadora.calcularCumplimiento(8, 10);

        assertEquals(80.0, resultado, 0.01);
    }

    @Test
    public void pruebaMetaMayor() {

        CalculadoraMetas calculadora = new CalculadoraMetas();

        double resultado = calculadora.calcularCumplimiento(12, 10);

        assertEquals(120.0, resultado, 0.01);
    }

    @Test
    public void pruebaMetaInvalida() {

        CalculadoraMetas calculadora = new CalculadoraMetas();

        assertThrows(
                IllegalArgumentException.class,
                () -> calculadora.calcularCumplimiento(5, 0)
        );
    }
}