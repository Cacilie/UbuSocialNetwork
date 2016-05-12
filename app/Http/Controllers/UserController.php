<?php

class UserController extends BaseController {

    /**
     * @param User $users
     */
    public function __construct(User $users)
    {
        $this->users = $users;
    }

loginUser1
    public function loginUser1()
    {
        Auth::loginUsingId(1);
    }

    public function loginUser2()
    {
        Auth::loginUsingId(2);
    }
}