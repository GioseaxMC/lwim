import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()],
	// build: {
    // 	minify: false,
    // 	sourcemap: true,
    // 	rollupOptions: {
    //   		output: {
    //     		// Keep function names readable
    //     		compact: false,
	// 	        // Preserve comments
    //     		comments: true
    //   		}
    // 	}
  	// },
	server: {
		allowedHosts: ['886e-78-208-129-80.ngrok-free.app']
	}
});
