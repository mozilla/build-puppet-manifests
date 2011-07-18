class root-user {
    include secrets
    user {
        "root":
            password => $secrets::root_password;
    }
}
