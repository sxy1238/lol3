function Food(obj) {
    this.obj=obj;
    var fields=[];
    obj.find('tr:first th[data-name]').each(function () {
        fields.push($(this).attr('data-name'));
    });
    this.fields=fields;
}
Food.prototype={
    append:function (data,opt) {
        var arr=[];
        $.each(this.fields,function () {
            arr.push(data[this]);
        });
        var html='<td>'+arr.join('</td><td>')+'</td><td>'
           +opt.join('|')+'</td>';
        this.obj.append('<tr data-id="'+data.id+'">'+html+'</tr>');
    },
};
function Editor(obj) {
    this.obj=obj;
}
Editor.prototype={
    fill:function (data) {
        this.empty();
        for(var k in data){
            this.obj.find('[name='+k+']').val(data[k]);
        }
    }
}