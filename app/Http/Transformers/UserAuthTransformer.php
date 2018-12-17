<?php

namespace App\Http\Transformers;

use League\Fractal\TransformerAbstract;

class UserAuthTransformer extends TransformerAbstract {

    public function transform(\App\User $user) {
              
        
        
        return [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'mobile' => $user->mobile,
            'company_name' => $user->company_name,
            'unique_token' => $user->unique_token,
            'authToken' => $user->remember_token,
            'role' => $user->role_id,
            // 'permissionGroupList' => $user->getRoles(),
            // 'email_internal' => $user->email_internal,
            // 'email_external' => $user->email_external,
            // 'department' => $user->department,
            //'designation' => $user->designation,
            //'avatar' => $user->avatar,
            // 'user_id'=> $user->user_id,
        ];
    }
}
