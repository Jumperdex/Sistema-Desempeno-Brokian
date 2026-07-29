package modelo;

public class CalculadoraMetas {

    public double calcularCumplimiento(int ventasRealizadas, int metaVentas) {

        if (metaVentas <= 0) {
            throw new IllegalArgumentException("La meta debe ser mayor que cero.");
        }

        return ((double) ventasRealizadas / metaVentas) * 100;
    }
}