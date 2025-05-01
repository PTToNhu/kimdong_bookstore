import { useState } from 'react';
import React from 'react';
import Input from "../../BackEnd/input";
import Navbar from "./navbar";
import Post from "./../../BackEnd/post";
import { Routes, Route } from 'react-router-dom';
import Edit from "./../../BackEnd/edit";
import Order from "./../../BackEnd/order"
export default function Admin() {
    return (
        <div className="flex w-[100%]">
            <Navbar/>
            <div className='w-full px-[30px] flex justify-center items-center'>
                <Routes>
                    <Route path="/input" element={<Input />} />
                    <Route path="/post/:Status?" element={<Post />} />
                    <Route path="/post/edit/:number?" element={<Edit />} />
                    <Route path="/order/" element={<Order />} />
                </Routes>
            </div>
        </div>
    );
}