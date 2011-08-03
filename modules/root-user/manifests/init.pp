class root-user {
    include secrets
    if "${secrets::root_password}" == "" {
        fail("No root password set")
    }
    user {
        "root":
            password => $secrets::root_password;
    }
}
