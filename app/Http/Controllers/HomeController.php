<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\User;
use \App\Role;
use App\Permission;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\DB;

class HomeController extends BaseController {

    public function index() {
        $user = User::all();
        return response()->json(['status_code' => 200, 'message' => 'User created successfully', 'data' => $user]);
    }

    public function attachUserRole($userId, $role) {
        $user = User::with("roles")->find($userId);
        $roleId = Role::where('name', $role)->first();
        $user->roles()->attach($roleId);
        return response()->json(['status_code' => 200, 'message' => 'Roles attached to user successfully', 'data' => $user]);
    }

    public function getUserRole($usetId) {
        return User::with("roles")->find($usetId);
    }

    public function attachPermission($role_name) {

        $posted_data = Input::all();

        $role = Role::where('name', $role_name)->first();
        $query = DB::table('permission_role')->where('role_id', '=', $role["id"])->delete();

        if ($posted_data != null) {
            foreach ($posted_data as $key => $value) {
                $permissionParam = $value;
                $permission = Permission::where('name', $permissionParam)->first();

                $role->attachpermission($permission);
            }
        }

       $role = $this->response->created();
        return $this->dispatchResponse(200, "Attached Successfully...!!", $role);
    }

    public function getPremissions($roleParam) {
        $role = Role::where('name', $roleParam)->first();
        return $this->response->array($role->perms);
    }

    public function getAllPremissions() {
        $permission = Permission::all();
        return $this->dispatchResponse(200, "Data", $permission);
    }

    public function getAllRoles() {
        $role = Role::whereNotIn('id',[3,5,6])->get();
        return $this->dispatchResponse(200, "Data", $role);
    }
    public function getSelectedRoles() {
        $role = Role::where('id','=',3)->get();
        return $this->dispatchResponse(200, "Data", $role);
    }

    public function createPermissions() {
        $posted_data = Input::all();

        $permission = new Permission();

        if ($permission->validate($posted_data)) {
            $model = Permission::create($posted_data);
            return $this->dispatchResponse(200, "Created Successfully...!!", $model);
        } else {
            throw new \Dingo\Api\Exception\StoreResourceFailedException('Unable to create  Permissions.', $permission->errors());
        }
    }

    public function createRoles() {
        $posted_data = Input::all();

        $role = new Role();

        if ($role->validate($posted_data)) {
            $model = Role::create($posted_data);
            return $this->dispatchResponse(200, "Created Successfully...!!", $model);
        } else {
            throw new \Dingo\Api\Exception\StoreResourceFailedException('Unable to create  Roles.', $role->errors());
        }
    }

    public function updateRoles($id) {
        $posted_data = Input::all();

        $model = Role::find((int) $id);

        if ($model->validate($posted_data)) {
            if ($model->update($posted_data))
                return $this->dispatchResponse(200, "Updated Successfully...!!", $model);
        } else {
            throw new \Dingo\Api\Exception\StoreResourceFailedException('Unable to update Roles.', $model->errors());
        }
    }

    public function updatePermissions($id) {
        $posted_data = Input::all();

        $model = Permission::find((int) $id);

        if ($model->validate($posted_data)) {
            if ($model->update($posted_data))
                return $this->dispatchResponse(200, "Updated Successfully...!!", $model);
        } else {
            throw new \Dingo\Api\Exception\StoreResourceFailedException('Unable to update Permissions.', $model->errors());
        }
    }

    function viewRoles($id) {
        $model = Role::find((int) $id);
        if ($model)
            return $this->dispatchResponse(200, "Data...!!", $model);
    }

    function viewPermissions($id) {
        $model = Permission::find((int) $id);
        if ($model)
            return $this->dispatchResponse(200, "Data...!!", $model);
    }
    
    function deleteRolesOfUser($user_id, $role_id) {
        $query = DB::table('role_user')->where([['role_id', '=', $role_id],['user_id', '=', $user_id]])->delete();
        if ($query)
            return $this->dispatchResponse(200, "Deleted Successfully...!!", null);
    }

}
