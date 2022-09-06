# Zainstaluj pakiet circlize 
install.packages("circlize")

# Za???aduj pakiet circlize 
library(circlize)

# Otw???rz plik .csv i zapisz go w formie macierzy
# UWAGA! Pierwszy wiersz zawiera nazw??? kraju pochodzenia, pierwsza kolumna zawiera nazw??? kraju docelowego
mydata<-read.table(choose.files(),header = TRUE,sep = ";",stringsAsFactors =FALSE )
df<-data.frame(mydata,row.names = TRUE)
df1<-data.matrix(df)

# Domy???lny chord diagram:
chordDiagramFromMatrix(df1)

# Upi???kszmy nieco wcze???niejsz??? wizualizacj??? ;) 
# Wyczy?????? wcze???niejsz??? wizualizacj???
circos.clear()

# Dodaj kierunki
chordDiagramFromMatrix(df1,directional = -1)

# Kolor wst??????ki powinien odzwierciedla??? przep???yw z kraju pochodzenia do kraju docelowego
chordDiagramFromMatrix(t(df1),directional = 1)

# Dodaj strza???ki kierunkowe
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows")

# Uporz???dkuj kraje wedle w???asnego uznania
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       order = c("SY","SA","IQ","LY", "US", "UK", "IT", "JO"))

# Dodaj odst???py pomi???dzy kategoriami
circos.clear()
circos.par(gap.after=7)
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       order = c("SY","SA","IQ","LY", "US", "UK", "IT", "JO"))

# Dostosuj palet??? kolor???w wedle w???asnego uznania
circos.clear()
circos.par(gap.after=7)
grid.col = c(SY = "blue",SA ="red",IQ="grey",LY="orange", US="pink", UK="purple", IT="yellow", JO="green")
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       order = c("SY","SA","IQ","LY", "US", "UK", "IT", "JO"),
                       grid.col = grid.col)

# Dodaj przezroczysto?????? je???li jest potrzebna
# Warto???ci powinny zawiera??? si??? w przedziale 0-1; 0 oznacza brak transparennto???ci, 1  pe???na przezroczysto??????.
circos.clear()
circos.par(gap.after=7)
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       order = c("SY","SA","IQ","LY", "US", "UK", "IT", "JO"),
                       grid.col = grid.col,
                       transparency=0.7)

# Mo???na doda??? obramowanie strza???ek
circos.clear()
circos.par(gap.after=7)
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       order = c("SY","SA","IQ","LY", "US", "UK", "IT", "JO"),
                       grid.col = grid.col,
                       transparency=0.7,
                       link.lwd = 2, link.lty = 2, link.border = "yellow")

# Uszeregowanie w zale???no???ci od grubo???ci wst??????ki - malej???ce
circos.clear()
circos.par(gap.after=7)
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       grid.col = grid.col,
                       transparency=0.7,
                       link.sort=TRUE,
                       link.decreasing = TRUE)

# Uszeregowanie w zale???no???ci od grubo???ci wst??????ki - rosn???ce
circos.clear()
circos.par(gap.after=7)
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       grid.col = grid.col,
                       transparency=0.7,
                       link.sort = TRUE,
                       link.decreasing = FALSE)

# Poka??? wyniki jako %
circos.clear()
circos.par(gap.after=7)
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       grid.col = grid.col,
                       transparency=0.7,
                       link.sort = TRUE,
                       link.decreasing = FALSE,
                       scale=TRUE)

# Poka??? strza???ki tylko dla istotnych po??????cze???
circos.clear()
circos.par(gap.after=7)
arr.col=data.frame(c("LY","LY"),c("IT","IQ"),c("black","black"))
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       link.arr.col = arr.col,
                       grid.col = grid.col,
                       transparency=0.8,
                       link.sort = TRUE,
                       link.decreasing = FALSE,
                       scale=TRUE)
# Ko???cowy - migracje Z Libii
circos.clear()
circos.par(gap.after=7)
grid.col = c(LY = "#70e000",SY="#ffb703",SA="#f0efeb",IQ="#bde0fe",US="#e9edc9",UK="#ffcdb2",IT="#fef9ef",JO="#f8ad9d")
arr.col=data.frame(c("LY","LY"),c("IT","JO"),c("black","black"))
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       link.arr.col = arr.col,
                       grid.col = grid.col,
                       transparency=0.6,
                       link.sort = TRUE,
                       link.decreasing = TRUE,
                       scale=TRUE)

# Ko???cowy - migracje Do Libii
circos.clear()
circos.par(gap.after=7)
grid.col = c(LY = "#70e000",SY="#ffb703",SA="#f0efeb",IQ="#bde0fe",US="#e9edc9",UK="#ffcdb2",IT="#fef9ef",JO="#f8ad9d")
arr.col=data.frame(c("SA","IQ"),c("LY","LY"),c("black","black"))
chordDiagramFromMatrix(t(df1),directional = 1,direction.type = "arrows",
                       link.arr.col = arr.col,
                       grid.col = grid.col,
                       transparency=0.6,
                       link.sort = TRUE,
                       link.decreasing = TRUE,
                       scale=TRUE)
