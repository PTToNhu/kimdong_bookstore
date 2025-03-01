import './App.css'
import {BrowserRouter, Routes, Route} from "react-router-dom"
import Home from '../components/Home'
import Category from '../components/Category'

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/category" element={<Category />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
