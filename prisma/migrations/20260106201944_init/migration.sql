-- CreateTable
CREATE TABLE "Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "cuit" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "fechaAlta" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "activo" BOOLEAN NOT NULL DEFAULT true
);

-- CreateTable
CREATE TABLE "Monotributo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "categoriaActual" TEXT NOT NULL,
    "tipoActividad" TEXT NOT NULL,
    "fechaInicioCategoria" DATETIME NOT NULL,
    "activo" BOOLEAN NOT NULL DEFAULT true,
    CONSTRAINT "Monotributo_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Factura" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "fechaEmision" DATETIME NOT NULL,
    "montoTotal" DECIMAL NOT NULL,
    "puntoVenta" INTEGER NOT NULL,
    "numero" INTEGER NOT NULL,
    CONSTRAINT "Factura_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CategoriaMonotributo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "categoria" TEXT NOT NULL,
    "tipoActividad" TEXT NOT NULL,
    "topeAnual" DECIMAL NOT NULL
);

-- CreateTable
CREATE TABLE "ResultadoRecategorizacion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "facturacion12Meses" DECIMAL NOT NULL,
    "categoriaActual" TEXT NOT NULL,
    "categoriaSugerida" TEXT,
    "porcentajeConsumo" DECIMAL NOT NULL,
    "estado" TEXT NOT NULL,
    "alerta" TEXT,
    "fechaCalculo" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_cuit_key" ON "Usuario"("cuit");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Monotributo_usuarioId_key" ON "Monotributo"("usuarioId");
