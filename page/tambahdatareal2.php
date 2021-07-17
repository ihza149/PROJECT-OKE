<!-- judul -->
<div class="panel-top">
    <b class="text-green"><i class="fa fa-plus-circle text-green"></i> Tambah data</b>
</div>
<form id="form" action="./proses/prosestambah.php" method="POST">
    <input type="hidden" value="datareal" name="op">
    <div class="panel-middle">
        <div class="group-input">
            <label for="supplier">Nama Kecamatan</label>
            <select class="form-custom" required name="supplier" id="supplier">
                <option selected disabled>--Pilih Nama Kecamatan--</option>
                <?php
                $query = "SELECT * FROM supplier";
                $execute = $konek->query($query);
                if ($execute->num_rows > 0) {
                    while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                        echo "<option value=\"$data[id_supplier]\">$data[namaSupplier]</option>";
                    }
                } else {
                    echo "<option value=\"\">Belum ada Nama Supplier</option>";
                }
                ?>
            </select>
        </div>
        <?php
        $query = "SELECT * FROM kriteria";
        $execute = $konek->query($query);
        if ($execute->num_rows > 0) {
            while ($data = $execute->fetch_array(MYSQLI_ASSOC)) {
                echo "<div class=\"group-input\">
                        <label for=\"$data[namaKriteria]\">$data[namaKriteria] :</label>
                        <input type='hidden' value=$data[id_kriteria] name='kriteria[]'>
                            <input class=\"form-custom\" required type=\"Number\" name=\"datareal[]\" id=\"$data[namaKriteria]\" placeholder=\"$data[namaKriteria]\">";
                echo "</input>
                      </div>
                ";
            }
        }
        ?>
        <!-- <div class="group-input">
                        <label for="KetersediaanPangan">Ketersediaan Pangan</label>
                            <select class="form-custom" required name="ketersediaan" id="KetersediaanPangan">
                            <option selected disabled>--Pilih BobotKetersediaanPangan--</option>
                            <option value="x<=3000">x<=3000</option>
                            <option value="3<x<=5000">3 < x < = 5000</option>
                            <option value="5<x<=10000">5 < x < = 10000</option>
                            <option value="10<x<=14000">10 < x < = 14000</option>
                            <option value="x>=15">x>=15</option>
                            </select>
    </div>
    <div class="group-input">
                        <label for="AksesPangan">Akses Pangan</label>
                            <select class="form-custom" required name="Akses" id="AksesPangan">
                            <option selected disabled>--Pilih Bobot Akses Pangan--</option>
                            <option value="x<=3000">x<=3000</option>
                            <option value="3<x<=5000">3 < x < = 5000</option>
                            <option value="5<x<=10000">5 < x < = 10000</option>
                            <option value="10<x<=14000">10 < x < = 14000</option>
                            <option value="x>=15">x>=15</option>
                            </select>
    </div>
    <div class="group-input">
                        <label for="PemanfaatanPangan">Pemanfaatan Pangan</label>
                            <select class="form-custom" required name="Pemanfaatan" id="PemanfaatanPangan">
                            <option selected disabled>--Pilih Bobot Pemanfaatan Pangan--</option>
                            <option value="x<=3000">x<=3000</option>
                            <option value="3<x<=5000">3 < x < = 5000</option>
                            <option value="5<x<=10000">5 < x < = 10000</option>
                            <option value="10<x<=14000">10 < x < = 14000</option>
                            <option value="x>=15">x>=15</option>
                            </select>
    </div> -->
    </div>
    <div class="panel-bottom">
        <button type="submit" id="buttonsimpan" class="btn btn-green"><i class="fa fa-save"></i> Simpan</button>
        <button type="reset" id="buttonreset" class="btn btn-second">Reset</button>
    </div>
</form>