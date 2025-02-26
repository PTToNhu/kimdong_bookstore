import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import './App.css';
import Category from './components/Category';  // Fixed the typo: 'Catefory' -> 'Category'
import Home from './components/Home';

function App() {
  return (
    <BrowserRouter> {/* BrowserRouter should wrap your entire app */}
      <div className="App">
        <h5>React App</h5>        
        <Routes>
          <Route index element={<Home />} />
          <Route path="/cat" element={<Category />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
