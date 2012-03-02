class boot {
    include boot::fsck
    include boot::grub
    include boot::verbose
}
