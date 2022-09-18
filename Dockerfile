FROM ubuntu:focal
RUN sed -i 's/archive.ubuntu.com/ftp.kaist.ac.kr/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install build-essential xorriso syslinux
WORKDIR /root
RUN git clone https://github.com/ipxe/ipxe
WORKDIR /root/ipxe/src
RUN make bin/ipxe.lkrn bin/ipxe.dsk bin/ipxe.pdsk bin/undionly.kpxe bin/ipxe.pxe bin-x86_64-efi/ipxe.efi bin-x86_64-efi/snp.efi bin-x86_64-efi/snponly.efi
RUN mkdir hybrid
RUN util/genfsimg -o hybrid/ipxe.usb bin/ipxe.lkrn bin-x86_64-efi/ipxe.efi
RUN util/genfsimg -o hybrid/ipxe.iso bin/ipxe.lkrn bin-x86_64-efi/ipxe.efi