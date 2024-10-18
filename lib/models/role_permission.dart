enum Role { ADMIN, SUPERADMIN, USER }

enum Permission {
  READ_USER,
  CREATE_USER,
  UPDATE_USER,
  DELETE_USER,
  CREATE_ROLE,
  READ_ROLE,
  UPDATE_ROLE,
  DELETE_ROLE,
  READ_PERMISSION,
  READ_ASSISTANCE,
  CREATE_ASSISTANCE,
  UPDATE_ASSISTANCE,
  DELETE_ASSISTANCE,
  LOGIN_AUTHENTICATION,
  LOGOUT_AUTHENTICATION,
  VERIFY_AUTHENTICATION,
  REFRESH_AUTHENTICATION,
}

Role roleFromString(String role) {
  const Map<String, Role> roleByString = {
    "admin": Role.ADMIN,
    "superadmin": Role.SUPERADMIN,
    "user": Role.USER,
  };

  return roleByString[role] ?? Role.USER;
}

Permission permissionFromString(String permission) {
  const Map<String, Permission> permissionByString = {
    "read_user": Permission.READ_USER,
    "create_user": Permission.CREATE_USER,
    "update_user": Permission.UPDATE_USER,
    "delete_user": Permission.DELETE_USER,
    "create_role": Permission.CREATE_ROLE,
    "read_role": Permission.READ_ROLE,
    "update_role": Permission.UPDATE_ROLE,
    "delete_role": Permission.DELETE_ROLE,
    "read_permission": Permission.READ_PERMISSION,
    "read_assistance": Permission.READ_ASSISTANCE,
    "create_assistance": Permission.CREATE_ASSISTANCE,
    "update_assistance": Permission.UPDATE_ASSISTANCE,
    "delete_assistance": Permission.DELETE_ASSISTANCE,
    "login_authentication": Permission.LOGIN_AUTHENTICATION,
    "logout_authentication": Permission.LOGOUT_AUTHENTICATION,
    "verify_authentication": Permission.VERIFY_AUTHENTICATION,
    "refresh_authentication": Permission.REFRESH_AUTHENTICATION,
  };
  return permissionByString[permission] ?? Permission.READ_USER;
}

bool canReadUser(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.READ_USER);
}

bool canCreateUser(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.CREATE_USER);
}

bool canUpdateUser(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.UPDATE_USER);
}

bool canDeleteUser(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.DELETE_USER);
}

bool canCreateRole(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.CREATE_ROLE);
}

bool canReadRole(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.READ_ROLE);
}

bool canUpdateRole(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.UPDATE_ROLE);
}

bool canDeleteRole(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.DELETE_ROLE);
}

bool canReadPermission(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.READ_PERMISSION);
}

bool canReadAssistance(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.READ_ASSISTANCE);
}

bool canCreateAssistance(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.CREATE_ASSISTANCE);
}

bool canUpdateAssistance(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.UPDATE_ASSISTANCE);
}

bool canDeleteAssistance(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.DELETE_ASSISTANCE);
}

bool canLoginAuthentication(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.LOGIN_AUTHENTICATION);
}

bool canLogoutAuthentication(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.LOGOUT_AUTHENTICATION);
}

bool canVerifyAuthentication(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.VERIFY_AUTHENTICATION);
}

bool canRefreshAuthentication(List<Permission> permissions, List<Role> roles) {
  if (roles.contains(Role.SUPERADMIN)) {
    return true;
  }
  return permissions.contains(Permission.REFRESH_AUTHENTICATION);
}

String roleToString(Role role) {
  const Map<Role, String> roleByString = {
    Role.ADMIN: "admin",
    Role.SUPERADMIN: "superadmin",
    Role.USER: "user",
  };

  return roleByString[role] ?? "user";
}

String permissionToString(Permission permission) {
  const Map<Permission, String> permissionByString = {
    Permission.READ_USER: "read_user",
    Permission.CREATE_USER: "create_user",
    Permission.UPDATE_USER: "update_user",
    Permission.DELETE_USER: "delete_user",
    Permission.CREATE_ROLE: "create_role",
    Permission.READ_ROLE: "read_role",
    Permission.UPDATE_ROLE: "update_role",
    Permission.DELETE_ROLE: "delete_role",
    Permission.READ_PERMISSION: "read_permission",
    Permission.READ_ASSISTANCE: "read_assistance",
    Permission.CREATE_ASSISTANCE: "create_assistance",
    Permission.UPDATE_ASSISTANCE: "update_assistance",
    Permission.DELETE_ASSISTANCE: "delete_assistance",
    Permission.LOGIN_AUTHENTICATION: "login_authentication",
    Permission.LOGOUT_AUTHENTICATION: "logout_authentication",
    Permission.VERIFY_AUTHENTICATION: "verify_authentication",
    Permission.REFRESH_AUTHENTICATION: "refresh_authentication",
  };
  return permissionByString[permission] ?? "read_user";
}

String roleSpanishName(Role role) {
  const Map<Role, String> roleByString = {
    Role.ADMIN: "Administrador",
    Role.SUPERADMIN: "Super Administrador",
    Role.USER: "Usuario",
  };

  return roleByString[role] ?? "Usuario";
}