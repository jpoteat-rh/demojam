sudo virt-install --name bootc-edge-device --memory 4096 --vcpus 2 --disk size=20 --network network=default --location ./base-os.iso --os-variant generic --initrd-inject ks.cfg --extra-args "inst.ks=file:/ks.cfg"

