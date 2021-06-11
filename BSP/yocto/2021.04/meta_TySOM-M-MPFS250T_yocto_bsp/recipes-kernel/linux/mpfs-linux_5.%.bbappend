FILESEXTRAPATHS_append := ":${THISDIR}/files"



SRC_URI_append_tysom-m-mpfs250t = " \
    file://0001-PFSoC-Icicle-kit-Adding-DTS-makefile.patch \
    file://0002-PFSoC-MAC-Interface-auto-negotiation.patch \
    file://0001-V2-GPIO-Driver-updates.patch \
    file://0003-Microchip-Adding-I2C-Support-for-the-Polarfire-SoC.patch \
    file://0008-pac139x.patch \
    file://v11-0004-PCI-microchip-Add-host-driver-for-Microchip-PCIe.patch \
    file://v1-0002-Add-definition-for-Microchip-PolarFire-SoC.patch \
    file://v3-0001-dt-bindings-clk-microchip-Add-Microchip-PolarFire.patch \
    file://v3-0002-clk-microchip-Add-driver-for-Microchip-PolarFire-.patch \
    file://0001-V5-Adding-Microchip-MUSB-Driver.patch \
    file://0002-uio-can-Microchip-PolarFire-add-CAN-support-via-uio.patch \
    file://0001-Microsemi-UIO-Fabric-DMA-support.patch \
    file://0003-mbox-add-polarfire-soc-system-controller-mailbox.patch \
    file://0002-atish-soc-support.patch \
    file://0001-rng-add-support-for-rng-on-the-polarfire-soc.patch \
    file://0005-soc-add-polarfire-soc-system-controller.patch \
    file://0007-sys-serv-fpga-digest-and-serial-num.patch \
    file://v1-0001-dt-bindings-rtc-microchip-Add-Microchip-PolarFire.patch \
    file://v1-0002-rtc-microchip-Add-driver-for-Microchip-PolarFire-.patch \
    file://v1-0001-dt-bindings-dma-microchip-Add-Microchip-PolarFire.patch \
    file://v1-0002-uio-pdma-microchip-Add-uio-driver-for-Microchip-P.patch \
    file://v1-0001-riscv-add-cpu-frequency-reporting-to-cpuinfo.patch \
    file://v1-0001-dmabuf-u-dma-buf-add-u-dma-buf-to-v5.6.x.patch \
    file://tysom-m-mpfs250t.dts \
    file://0004-TySOM-M-MPFS250T-Adding-DTS-makefile.patch \
    file://0005-TySOM-M-MPFS250T-gpio.patch \
 "

do_configure_prepend_tysom-m-mpfs250t() {
    cp -f ${WORKDIR}/tysom-m-mpfs250t.dts ${S}/arch/riscv/boot/dts/aldec
}


SRC_URI_append_tysom-m-mpfs250t = " file://defconfig"

COMPATIBLE_MACHINE = "(tysom-m-mpfs250t)"
