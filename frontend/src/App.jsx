import './App.css'
import { BrowserRouter, Routes, Route } from "react-router-dom"
import Home from './components/Home'
import Category from './components/Category'
import AboutUs from './components/AboutUs/AboutUs'
import Master_Classe from './components/Master_Classe/Master_Classe.jsx'
import FAQ from './components/FAQ/FAQ'
import Question from './components/Question/Question'

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route index element={<Home />} />
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
