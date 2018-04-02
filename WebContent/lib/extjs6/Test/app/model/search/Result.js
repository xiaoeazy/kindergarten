Ext.define('app.model.search.Result', {
    extend: 'app.model.Base',

    fields: [
        {
            type: 'int',
            name: 'id'
        },
        {
            type: 'string',
            name: 'title'
        },
        {
            type: 'string',
            name: 'thumbnail'
        },
        {
            type: 'string',
            name: 'url'
        },
        {
            type: 'string',
            name: 'content'
        }
    ],

    hasMany: {
        name: 'attachments',
        model: 'search.Attachment'
    }
});
