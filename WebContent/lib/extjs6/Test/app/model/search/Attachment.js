Ext.define('app.model.search.Attachment', {
    extend: 'app.model.Base',

    fields: [
        {
            type: 'int',
            name: 'id'
        },
        {
            type: 'string',
            name: 'url'
        },
        {
            type: 'string',
            name: 'title'
        }
    ]
});
