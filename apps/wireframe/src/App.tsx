import { BrowserRouter, Routes, Route } from "react-router";
import { Home } from "./pages/Home";
import { Showcase } from "./pages/Showcase";

export function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/showcase" element={<Showcase />} />
      </Routes>
    </BrowserRouter>
  );
}
