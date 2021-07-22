<?php
$id = htmlspecialchars(@$_GET['id']);
$querylihat = "SELECT id_supplier,nilai_real,id_datareal,kriteria.namaKriteria AS namaKriteria FROM datareal INNER JOIN kriteria USING(id_kriteria) WHERE id_supplier='$id'";
$execute2 = $konek->query($querylihat);
if ($execute2->num_rows == 0) {
    header('location:./?page=datareal');
}
?>
<!-- judul -->
<div class="panel-top">
    <b class="text-green">Detail data</b>
</div>
<form>
    <div class="panel-middle">
        <div class="group-input">
            <?php
            $query = "SELECT namaSupplier FROM supplier WHERE id_supplier='$id'";
            $execute = $konek->query($query);
            $data = $execute->fetch_array(MYSQLI_ASSOC);
            ?>
            <div class="group-input">
                <label for="jenisbarang">Jenis Barang</label>
                <input class="form-custom" value="<?php echo $data['namaSupplier']; ?>" disabled type="text" autocomplete="off" required name="jenissupplier" id="jenissupplier" placeholder="Jenis Supplier">
            </div>
        </div>
        <?php
        $execute2 = $konek->query($querylihat);
        while ($data = $execute2->fetch_array(MYSQLI_ASSOC)) {

            echo " <div class=\"group-input\">
            <label for=\"$data[namaKriteria]\">$data[namaKriteria]/Ton :</label>
            <input type='hidden' value=\"$data[id_datareal]\" name=\"id[]\">
            <input type=\"text\" class=\"form-custom\" disabled autocomplete=\"off\" placeholder=\"$data[nilai_real]\" id=\"$data[namaKriteria]\" name=\"nilai[]\">
            </div>";
        }
        ?>

    </div>
    <div class="panel-bottom">
    </div>
</form>