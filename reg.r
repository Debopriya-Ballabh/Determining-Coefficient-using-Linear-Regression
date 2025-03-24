#install and library the required packages
install.packages("readxl")
library("readxl")

#Settin the working directory
setwd("F:\\Debo-Traj-Data\\draft2\\supplementary")
getwd()

#Read the experimental data
df <-read_excel("F:\\Debo-Traj-Data\\draft2\\supplementary\\regress.xlsx")
df

#Statistical summary of the data
summary(df)

#Checking correlation to observe the independence of data
cor(df$`Δ Electrostatic (Kcal/mol)`,df$pMIC)
cor(df$`Δ Vdw (Kcal/mol)`, df$pMIC)

#checking the normality
hist(df$pMIC)

#checking linearity
plot(df$pMIC~df$`Δ Vdw (Kcal/mol)`)
plot(df$pMIC~df$`Δ Electrostatic (Kcal/mol)`)

#modeling using linear regression modeling
model <- lm (pMIC~`Δ Vdw (Kcal/mol)`+ `Δ Electrostatic (Kcal/mol)`, data = df)
summary(model)

#Plotting of the result obtained from the model
par(mfrow = c(2,2))
plot(model)
