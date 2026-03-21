// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import starlightImageZoom from 'starlight-image-zoom';
import starlightLinksValidator from 'starlight-links-validator';

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: 'PdePreludat',
      social: [{ icon: 'github', label: 'GitHub', href: 'https://github.com/uqbar-project/pdepreludat' }],
      favicon: '/favicon.png',
      defaultLocale: 'root',
      locales: {
        root: {
          label: 'Español',
          lang: 'es'
        },
      },
      sidebar: [
        {
					label: 'Guías',
					items: [
					  'guides/entorno',
	          'guides/nuevo_proyecto',
					  'guides/flujo_de_trabajo',
					  // 'guides/haskelite',
					  'guides/problemas',
					],
				},
        {
          label: 'Reference',
          autogenerate: { directory: 'reference' },
        },
      ],
      plugins: [
        starlightImageZoom(),
        starlightLinksValidator(),
      ],
    }),
  ],
});
