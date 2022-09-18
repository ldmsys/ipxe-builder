FROM ubuntu:focal
RUN apt-get update
RUN apt-get install -y build-essential xorriso syslinux isolinux git liblzma-dev
WORKDIR /root
RUN git clone https://github.com/ipxe/ipxe
WORKDIR /root/ipxe/src
RUN make bin/ipxe.lkrn bin/ipxe.dsk bin/ipxe.pdsk bin/undionly.kpxe bin/ipxe.pxe bin-x86_64-efi/ipxe.efi bin-x86_64-efi/snp.efi bin-x86_64-efi/snponly.efi
RUN mkdir hybrid
RUN util/genfsimg -o hybrid/ipxe.usb bin/ipxe.lkrn bin-x86_64-efi/ipxe.efi
RUN util/genfsimg -o hybrid/ipxe.iso bin/ipxe.lkrn bin-x86_64-efi/ipxe.efi