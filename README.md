# Dotnet Store

Modern ve kullanıcı dostu bir e-ticaret web uygulaması. ASP.NET Core 9.0 ve Entity Framework Core ile geliştirilmiştir.

## İçerik

- [Özellikler](#-özellikler)
- [Teknolojiler](#-teknolojiler)
- [Kurulum](#-kurulum)
- [Kullanım](#-kullanım)
- [Docker](#-docker)
- [Veritabanı](#-veritabanı)
- [Proje Yapısı](#-proje-yapısı)
- [Katkıda Bulunma](#-katkıda-bulunma)

## Özellikler

- **Ürün Yönetimi**: Ürün listeleme, ekleme ve yönetim
- **E-ticaret Arayüzü**: Modern ve responsive tasarım
- **Veritabanı**: SQLite ile veri saklama
- **RESTful API**: MVC yapısı ile organize edilmiş controller'lar
- **Responsive Design**: Mobil uyumlu kullanıcı arayüzü
- **Entity Framework**: Code-First yaklaşımı ile veritabanı yönetimi

## Teknolojiler

- **Backend**: ASP.NET Core 9.0
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap
- **Veritabanı**: SQLite
- **ORM**: Entity Framework Core 9.0.2
- **Container**: Docker
- **IDE**: Visual Studio Code / Visual Studio

## Kurulum

### Gereksinimler

- [.NET 9.0 SDK](https://dotnet.microsoft.com/download/dotnet/9.0)
- [Git](https://git-scm.com/)

### Adımlar

1. **Projeyi klonlayın**

   ```bash
   git clone https://github.com/emirhankalkan/aspnetcore9-store.git
   cd aspnetcore9-store
   ```

2. **Bağımlılıkları yükleyin**

   ```bash
   dotnet restore
   ```

3. **Veritabanını oluşturun**

   ```bash
   dotnet ef database update
   ```

4. **Uygulamayı çalıştırın**

   ```bash
   dotnet run
   ```

5. **Tarayıcıda açın**
   ```
   https://localhost:5001
   ```

## Kullanım

### Ana Sayfa

- Uygulamanın ana sayfası üzerinden mağaza bilgilerine ulaşabilirsiniz
- Slider ve ürün showcaseları mevcuttur

### Ürün Yönetimi

- `/Urun` endpoint'i üzerinden ürün listesini görüntüleyebilirsiniz
- Ürün ekleme, düzenleme ve silme işlemleri yapabilirsiniz

### API Endpoints

```
GET  /                    # Ana sayfa
GET  /Urun               # Ürün listesi
GET  /Home/Privacy       # Gizlilik sayfası
```

## Docker

### Docker ile Çalıştırma

1. **Image oluşturun**

   ```bash
   docker build -t dotnet-store .
   ```

2. **Container'ı çalıştırın**

   ```bash
   docker run -p 8080:8080 -p 8081:8081 dotnet-store
   ```

3. **Veritabanı volume ile**
   ```bash
   docker run -p 8080:8080 -v $(pwd)/store.db:/app/store.db dotnet-store
   ```

### Docker Compose (Opsiyonel)

```yaml
version: "3.8"
services:
  dotnet-store:
    build: .
    ports:
      - "8080:8080"
      - "8081:8081"
    volumes:
      - ./store.db:/app/store.db
    environment:
      - ASPNETCORE_ENVIRONMENT=Production
```

## Veritabanı

### Entity Framework Migrations

```bash
# Yeni migration oluştur
dotnet ef migrations add MigrationName

# Veritabanını güncelle
dotnet ef database update

# Migration'ları listele
dotnet ef migrations list
```

### Urun Model

```csharp
public class Urun
{
    public int Id { get; set; }
    public string UrunAdi { get; set; }
    public double Fiyat { get; set; }
    public bool Aktif { get; set; }
}
```

## Proje Yapısı

```
dotnet-store/
├── Controllers/           # MVC Controller'ları
│   ├── HomeController.cs
│   └── UrunController.cs
├── Models/               # Veri modelleri
│   ├── DataContext.cs
│   ├── Urun.cs
│   └── ErrorViewModel.cs
├── Views/                # Razor view'ları
│   ├── Home/
│   ├── Urun/
│   └── Shared/
├── wwwroot/             # Static dosyalar
│   ├── css/
│   ├── js/
│   ├── img/
│   └── e-commerce/
├── Migrations/          # EF Core migrations
├── Properties/          # Launch ayarları
├── Program.cs           # Uygulama giriş noktası
├── Dockerfile          # Docker yapılandırması
├── .gitignore         # Git ignore kuralları
└── dotnet-store.csproj # Proje dosyası
```

## Geliştirme

### Hot Reload ile Geliştirme

```bash
dotnet watch run
```

### Debug Modu

```bash
dotnet run --environment Development
```

### Test

```bash
dotnet test
```

### Ana Sayfa

![Ana Sayfa](wwwroot/img/slider-1.jpeg)

### Ürün Listesi

Modern ve kullanıcı dostu ürün listeleme arayüzü

## Katkıda Bulunma

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

---
