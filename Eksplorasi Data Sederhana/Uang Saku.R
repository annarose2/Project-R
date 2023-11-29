### Mempersiapkan data frame dari file .csv
### ---------------------------------------
dfSaku <- read.csv("Uang Saku Mahasiswa.csv", sep = ",",header = TRUE)
str(dfSaku)           # Perhatikan struktur data frame dfSaku
dfSaku <- dfSaku[-1]  # Menghapus kolom pertama X dari dfSaku
summary(dfSaku)       # Ringkasan statistik dfSaku. Apa makna mean(Sex) = 1.49?

### Perhatikan seluruh objek dfSaku bertipe INT yang tidak sesuai dengan data
### Sex dan Angkatan seharusnya BUKAN INT tetapi KATEGORI
### Ubah menggunakan fungsi factor
### -------------------------------------------------------------------------
dfSaku$Sex <- factor(dfSaku$Sex, labels = c("Laki-laki", "Perempuan"))
dfSaku$Angkatan <- factor(dfSaku$Angkatan, labels = c("2019", "2020", "2021"))
str(dfSaku)           # Struktur baru dari dfSaku
summary(dfSaku)       # Ringkasan statistik dfSaku setelah diperbaharui

### Ekplorasi data menggunakan beberapa plot sederhana
### --------------------------------------------------
attach(dfSaku)        # 'Menyambungkan' dfSaku ke search path dari R

# Boxplot Gender vs Umur
# ---------------------------
plot(x = Sex, y = Umur, xlab = "Gender Mahasiswa", ylab = "Umur (bulan)", 
     main = "Boxplot Gender vs Umur Mahasiswa")

# Boxplot Gender vs Uang Saku
# ---------------------------
plot(x = Sex, y = Saku, xlab = "Gender Mahasiswa", ylab = "Uang Saku (Rp)", 
     main = "Boxplot Gender vs Uang Saku")         # Lihat skala sumbu Y 

plot(x = Sex, y = Saku/1000000, xlab = "Gender Mahasiswa", ylab = "Uang Saku (Juta Rp)", 
     main = "Boxplot Gender vs Uang Saku")         # Lihat skala sumbu Y

# Pie chart Angkatan
# ------------------
fAngkatan  <- table(Angkatan)            # Tabel frekuensi angkatan mahasiswa
frAngkatan <- fAngkatan/nrow(dfSaku)*100 # Frekuensi relatif
pie(fAngkatan)   # Kurang sempurna, tanpa label
pie(frAngkatan)  # Kurang sempurna, tanpa label, tidak berbeda dg pie sebelumnya.

pie(fAngkatan, labels = paste(Angkatan, "\n", fAngkatan, "Orang"))
pie(frAngkatan, labels = paste(Angkatan, "\n", round(frAngkatan, 2), "%"))

# Scatter plot Uang Saku vs Belanja
# ---------------------------------
plot(Saku/1000000, Belanja/1000000, xlab = "Uang Saku (Juta Rp)", 
     ylab = "Belanja (Juta Rp)", main = "Plot Uang Saku vs Belanja Mahasiswa")

