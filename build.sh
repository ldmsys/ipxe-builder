#!/bin/bash


[ -n "script.ipxe "] && echo "script.ipxe doesn't exist!" && exit 1
cd src
make bin/ipxe.lkrn bin/ipxe.dsk bin/ipxe.pdsk bin/undionly.kpxe bin/ipxe.pxe bin-x86_64-efi/ipxe.efi bin-x86_64-efi/snp.efi bin-x86_64-efi/snponly.efi EMBED=../script.ipxe
mv bin/ipxe.lkrn bin/ipxe.dsk bin/ipxe.pdsk bin/undionly.kpxe bin/ipxe.pxe bin-x86_64-efi/ipxe.efi bin-x86_64-efi/snp.efi bin-x86_64-efi/snponly.efi ../archivetmp
mkdir builds
cd ..
tar -czvf builds.tar.gz builds/