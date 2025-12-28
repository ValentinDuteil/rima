import Home from './pages/Home.svelte';
import VerbDetail from './pages/VerbDetail.svelte';

const routes = {
  '/': Home,
  '/verbs/:id': VerbDetail,
};

export default routes;