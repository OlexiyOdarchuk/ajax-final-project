# IO Gateway: Buildroot external tree

Image for the Raspberry Pi 5 IO gateway. Buildroot `5b2ac4d9`.

## Build

```sh
make O=$PWD/output-iogw BR2_EXTERNAL=/path/to/final-project/br2-external iogw_rpi5_defconfig
make O=$PWD/output-iogw
```

The image is `output-iogw/images/sdcard.img`.

## Flash

```sh
sudo dd if=output-iogw/images/sdcard.img of=/dev/sdX bs=4M conv=fsync status=progress
```

## Login

`root` / `iogw` on the debug UART (115200 8N1) or `ssh root@iogw.local`.

## Changing the config

```sh
make O=$PWD/output-iogw menuconfig
make O=$PWD/output-iogw savedefconfig BR2_DEFCONFIG=/path/to/final-project/br2-external/configs/iogw_rpi5_defconfig
```
