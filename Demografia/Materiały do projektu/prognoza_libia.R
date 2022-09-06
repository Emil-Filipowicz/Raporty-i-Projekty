# Ten kod s???u???y do grupowania kraj???w metod??? k-???rednich
# Zainstaluj nast???puj???ce pakiety:
install.packages("ggsignif", type="win.binary") 
install.packages("ggpubr", type="win.binary") 
install.packages("factoextra")
install.packages("dplyr")
install.packages("writexl")
# Zaimportuj plik z danymi (File -> Import dataset -> From Excel...)
# Zawarto?????? pierwszej kolumny powinna by??? nazw??? wiersza

df<-data.frame(Demografia,row.names = TRUE)
mydata <- scale(df) # normalizacja zmiennych

# Za???aduj pakiet factoextra
library(factoextra)
# Wykorzystaj funkcj??? fviz_nbclust do ustalenia optymalnej liczby klastr???w
fviz_nbclust(mydata, kmeans, method = "silhouette") 
# Dokonaj grupowania obiekt???w podobnych za pomoc??? metody k-???rednich dla wskazanej liczby klastr???w
km.res <- kmeans(mydata, 2, nstart = 25)         
print(km.res) # Wyniki klastrowania
aggregate(df, by=list(cluster=km.res$cluster), mean) #???rednie warto???ci zmiennych w klastrach

library(RColorBrewer)
display.brewer.all()
# Wizualizacja klastr???w
fviz_cluster(km.res, data = mydata,
             palette = c("Accent"), 
             ellipse.type = "euclid", # Elipsa wok??? centroidu klastra
             star.plot = TRUE, # ??????czenie element???w skupienia z jego centrodiem
             repel = TRUE, # Nienak???adanie si??? etykiet
             ggtheme=theme_minimal())

# dodanie numeru klasra do wyj???ciowego zbioru danych
nowy <- cbind(df, cluster = km.res$cluster) 

# zapisanie danych do excela
library("dplyr")
library("writexl")


#nazwa wiersza jako kolumna
data<-tibble::rownames_to_column(nowy, "Libia")
write_xlsx(data, path = "Libia.xlsx") 

#Koniec


# Klastrowanie aglomeracyjne - Metoda Warda (nale???y wcze???niej wyznaczy??? optmyaln??? liczn??? grup)
hc.res <- eclust(mydata, "hclust", k = 3, hc_metric = "euclidean", 
                 hc_method = "ward.D2")
# Utworzenie dendrogramu
fviz_dend(hc.res, show_labels = TRUE,
          palette = "jco", as.ggplot = TRUE)

# dodanie numeru klasra do wyj???ciowego zbioru danych
nowy2 <- cbind(df, cluster = hc.res$cluster) 

data<-tibble::rownames_to_column(nowy2, "Libia")
write_xlsx(data, path = "Libia2.xlsx") 

