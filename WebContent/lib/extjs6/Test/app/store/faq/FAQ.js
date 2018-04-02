Ext.define('app.store.faq.FAQ', {
    extend: 'Ext.data.Store',
    alias: 'store.faq',

    model: 'app.model.faq.Category',

    proxy: {
        type: 'api',
        url: '~api/faq/faq'
    }
});
