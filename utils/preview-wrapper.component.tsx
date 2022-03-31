import React, { FunctionComponent } from 'react';
import I18nProvider from '../src/modules/core/i18n/i18n-provider.component';
import { Provider } from 'react-redux';
import { mockState, mockStore } from '../src/modules/core/state/store.mock';
import Theme from '../src/modules/core/theme/theme-provider.component';
import { ModalProvider } from 'styled-react-modal';

export const PreviewWrapper: FunctionComponent = ({ children }) => {
	const store = mockStore({
		...mockState,
		loading: {
			// @ts-ignore
			...mockState.loading,
			loadingConfig: {
				// @ts-ignore
				...mockState.loading.loadingConfig,
				loadingMessage: {
					title: 'this is a test',
					text: 'another test value a a a a another test value another test value another test value'
				},
			}
		},
		upsell: { 
			// @ts-ignore
			...mockState.upsell, 
			eventsInProgress: 1,
		},
	});
	return (
		<Provider store={store}>
			<Theme>
				<ModalProvider>
					<I18nProvider locale="en">{children}</I18nProvider>
				</ModalProvider>
			</Theme>
		</Provider>
	);
};
