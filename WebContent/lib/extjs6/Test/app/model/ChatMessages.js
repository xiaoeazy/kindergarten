Ext.define('app.model.ChatMessages', {
    extend: 'app.model.Base',

    fields: [
        {
            type: 'string',
            name: 'message'
        },
        {
            type: 'string',
            defaultValue: 'user',
            name: 'sender'
        }
    ]
});
