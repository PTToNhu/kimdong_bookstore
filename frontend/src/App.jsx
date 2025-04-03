import './App.css'
import { BrowserRouter, Routes, Route } from "react-router-dom"
import Home from '../components/Home/Home'
import Category from '../components/Category'
import AboutUs from '../components/AboutUs'
import Master_Classe from '../components/Master_Classe'
import FAQ from '../components/FAQ'
import Question from '../components/question'
import Login from '../components/Login/login'
import Contact from '../components/ContactUs/contact'

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/" element={<Home/>} />
        <Route path="/login" element={<Login/>} />
        <Route path="/contact" element={<Contact/>} />
        <Route path="/about_us" element={<AboutUs />} />
        <Route path="/about_us/master_classe" element={<Master_Classe />} />
        <Route path="/faq" element={<FAQ />} />
        <Route path="/faq/question" element={<Question />} />
        <Route path="/category" element={<Category />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
