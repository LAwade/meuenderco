import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Home from '../views/HomeView.vue'
import BuscarCep from '../views/BuscarCep.vue'

const routes: RouteRecordRaw[] = [
  { path: '/', name: 'Home', component: Home },
  { path: '/cep', name: 'Cep', component: BuscarCep },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router
