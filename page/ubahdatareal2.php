<?php
$id = htmlspecialchars(@$_GET['id']);
$querylihat = "SELECT id_supplier,nilai_real,id_datareal,kriteria.namaKriteria AS namaKriteria FROM datareal INNER JOIN kriteria USING(id_kriteria) WHERE id_supplier='$id'";
$execute2 = $konek->query($querylihat);
if ($execute2->num_rows == 0) {
    header('location:./?page=datareal');
}
?>
<!-- judul -->
<div class="panel-top panel-top-edit">
    <b><i class="fa fa-pencil-alt"></i> Ubah data</b>
</div>
<form id="form" action="./proses/prosesubah.php" method="POST">
    <input type="hidden" value="datareal" name="op">
    <div class="panel-middle">
        <div class="group-input">
            <div class="group-input">
                <?php
                $query = "SELECT namaSupplier FROM supplier WHERE id_supplier='$id'";
                $execute = $konek->query($query);
                $data = $execute->fetch_array(MYSQLI_ASSOC);
                ?>
                <div class="group-input">
                    <label for="jenisbarang">Nama Kecamatan</label>
                    <input class="form-custom" value="<?php echo $data['namaSupplier']; ?>" disabled type="text" autocomplete="off" required name="supplier" id="supplier">
                </div>
            </div>
        </div>
        <?php
        $execute2 = $konek->query($querylihat);
        while ($data = $execute2->fetch_array(MYSQLI_ASSOC)) {
            echo "<div class=\"group-input\">
                    <label for=\"$data[namaKriteria]\">$data[namaKriteria]</label>
                    <input type='hidden' value=\"$data[id_datareal]\" name=\"id[]\">
                    <input type=\"number\" class=\"form-custom\"required autocomplete=\"off\" value=\"$data[nilai_real]\" placeholder=\"$data[namaKriteria]\" id=\"$data[namaKriteria]\" name=\"datareal[]\">
                    ";
            echo " 
            </div>
                ";
        }
        ?>
    </div>
    <div class="panel-bottom">
        <button type="submit" id="buttonsimpan" class="btn btn-green"><i class="fa fa-save"></i> Simpan</button>
        <button type="reset" id="buttonreset" class="btn btn-second">Reset</button>
    </div>
</form>