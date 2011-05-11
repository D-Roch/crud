%{
    models = [];
	for(controllerClass in play.Play.classloader.getAssignableClasses(_('controllers.CRUD'))) {
		resourceModel = _('controllers.CRUD$ObjectType').get(controllerClass);
		if(resourceModel != null) {
			models.add(resourceModel);
		}
	}
}%

%{ models.eachWithIndex() { item, i -> }%
	%{
		attrs = [:]
		attrs.put('type', item)
	}%
    #{doBody vars:attrs /}
%{ } }%