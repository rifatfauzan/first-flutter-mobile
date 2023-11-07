# Tugas Individu - Rifat Fauzan / 2206082184

## Tugas 1

<details>
<summary><b>Details</b></summary>

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
1. **Stateless Widget**
    - Tidak Berubah: Sebuah StatelessWidget tidak dapat mengubah statenya selama masa hidupnya. Ini berarti bahwa setelah widget dibuat, nilai-nilai dan konfigurasinya tetap sama.
    - Sederhana dan Cepat: Karena tidak ada manajemen state, pembuatan ulang widget (rebuilding) berlangsung dengan sangat cepat.
    - Contoh Penggunaan: Cocok untuk bagian UI yang sederhana dan tidak berubah, seperti ikon, teks, dan gambar yang statis.
2. **Stateful Widget**
    - Dinamis: Sebuah StatefulWidget mampu mengubah statenya sepanjang masa hidupnya. Ini berarti bahwa widget dapat memperbarui UI berdasarkan interaksi pengguna atau data eksternal.
    - Lebih Kompleks: Dibandingkan dengan StatelessWidget, StatefulWidget memerlukan manajemen state yang lebih kompleks. Ini mempengaruhi performa terutama jika banyak pembaruan state terjadi.
    - Pemeliharaan State: StatefulWidgets memiliki objek state terpisah yang menyimpan state. Objek state ini bertahan meski terjadi hot reload dan pembuatan ulang widget.
    - Contoh Penggunaan: Cocok untuk bagian UI yang memerlukan interaksi pengguna atau pembaruan data, seperti formulir, animasi, atau timer.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. **MyHomePage:** Kelas ini merepresentasikan halaman utama aplikasi Anda. Ia mengextends StatelessWidget, yang berarti ia tidak mempertahankan state apapun antar pemanggilan build.
2. **Scaffold:** Widget yang menyediakan struktur dasar tampilan visual untuk aplikasi, termasuk AppBar, body, dan floatingActionButton.
3. **AppBar:** Sebuah Material Design app bar. Biasanya digunakan untuk menampilkan judul aplikasi, branding, atau navigasi.
4. **Text:** Widget yang menampilkan serangkaian karakter dengan gaya yang dapat disesuaikan.
5. **SingleChildScrollView:** Sebuah box yang dapat scroll, yang cocok untuk box tunggal yang akan memiliki beberapa anak tetapi tidak semua anak terlihat sekaligus.
6. **Padding:** Widget yang memberikan padding pada widget anaknya.
7. **Column:** Sebuah box yang menampilkan anak-anaknya dalam urutan vertikal.
8. **GridView:** Sebuah scrollable grid yang menampilkan widget sebagai tiles.
9. **ShopCard:** Kelas widget buatan sendiri yang menerima objek ShopItem dan menampilkan informasinya dalam bentuk card.
10. **Material:** Sebuah widget yang memberikan tampilan berdasarkan Material Design.
11. **InkWell:** Sebuah rectangle area yang dapat diklik dan memberikan efek visual saat ditekan.
12. **Container:** Sebuah box yang mengandung widget lain dan dapat diatur untuk memberikan padding, margin, ukuran, dan lain-lain.
13. **Icon:** Widget yang menampilkan sebuah ikon Material Design.
14. **Center:** Sebuah widget yang menengahkan widget anaknya.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. **Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.**
    - Jalankan *command* `flutter create shs_store` untuk *generate* proyek Flutter
    - Masuk ke dalam direktori proyek tersebut dengan *command* `cd shs_store`
2. **Membuat tiga tombol sederhana dengan ikon dan teks**
    - Pada `main.dart`hapus `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`
    - Pada `menu.dart`:
    - Tambahkan teks dan card dengan menambahkan barang-barang yang dijual. Define tipe pada list seperti berikut:
        ```
        class ShopItem {
            final String name;
            final IconData icon;

            ShopItem(this.name, this.icon);
        }
        ```
    - Ubah sifat widget halaman dari stateful menjadi stateless. Lakukan perubahan pada bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`. Selain itu, tambahkan barang-barang yang dijual (nama, harga, dan icon barang tersebut) dengan code berikut:
        ```
        final List<ShopItem> items = [
            ShopItem("Lihat Item", Icons.checklist),
            ShopItem("Tambah Item", Icons.add_shopping_cart),
            ShopItem("Logout", Icons.logout),
        ];
        ```
    - Lalu ubah method @override `Widget build(BuildContext context)` hingga menjadi seperti ini:
        ```
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: const Text(
                    'SHS store',
                    style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.grey[900],
                    elevation: 5, // Control the shadow depth
                    shadowColor: Colors.black, // Color of the shadow
                ),
                body: SingleChildScrollView(
                    // Widget wrapper yang dapat discroll
                    child: Padding(
                        padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                        child: Column(
                            // Widget untuk menampilkan children secara vertikal
                            children: <Widget>[
                                const Padding(
                                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                                    child: Text(
                                        'SHS Store', // Text yang menandakan toko
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                ),
                                // Grid layout
                                GridView.count(
                                    // Container pada card kita.
                                    primary: true,
                                    padding: const EdgeInsets.all(20),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 3,
                                    shrinkWrap: true,
                                    children: items.map((ShopItem item) {
                                        // Iterasi untuk setiap item
                                        return ShopCard(item);
                                    }).toList(),
                                ),
                            ],
                        ),
                    ),
                ),
            );
        }
        ```
    - Tampilkan card dengan membuat widget stateless baru:
        ```
        class ShopCard extends StatelessWidget {
            final ShopItem item;

            const ShopCard(this.item, {super.key}); // Constructor

            @override
            Widget build(BuildContext context) {
                return Material(
                color: Colors.indigo,
                child: InkWell(
                    child: Container(
                    // Container untuk menyimpan Icon dan Text
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Icon(
                            item.icon,
                            color: Colors.white,
                            size: 30.0,
                            ),
                            const Padding(padding: EdgeInsets.all(3)),
                            Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            ),
                        ],
                        ),
                    ),
                    ),
                ),
                );
            }
            }
        ```
2. **Memunculkan Snackbar**
    - Di `menu.dart` pada `class ShopCard extends StatelessWidget` tambahkan pada method override hingga menjadi seperti di bawah ini:
    ```
    @override
    Widget build(BuildContext context){
        return Material(
            ....
            child: InkWell(
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                ....
            )
        )
    }
               
    ```
4. Bonus
    - Buat parameter baru
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.lightGreen),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.lightBlue),
        ShopItem("Logout", Icons.logout, Colors.redAccent),
    ];
    ```
    ```
    class ShopItem {
        final String name;
        final IconData icon;
        final Color color; // Menambahkan field baru untuk warna

        ShopItem(this.name, this.icon, this.color);
    }
    ```
    - Tambahkan warna yang diinginkan pada class `ShopCard`
    ```
    class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: item.color, // Menggunakan warna dari item
            // (Sisa kode yang sama seperti sebelumnya)
            );
        }
    }
    ```