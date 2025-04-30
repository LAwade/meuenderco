import './bootstrap';
import '../../frontend/src/style.css'
import App from '../../frontend/src/App.vue'; // Ajuste o caminho para App.vue
import router from '../../frontend/src/router';

import { createApp } from 'vue';
const app = createApp(App);
app.use(router);
app.mount('#app');