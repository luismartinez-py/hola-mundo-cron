try {
    console.log("¡Hola mundo! Ejecutado a las 21:00");
    // Aquí iría tu lógica real
  } catch (error) {
    console.error("Ocurrió un error inesperado:", error);
    process.exit(1); // Importante: termina con error para que run.sh lo detecte
  }
  