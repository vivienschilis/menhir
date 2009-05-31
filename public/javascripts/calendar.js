var Calendar = Class.create({
	
	initialize: function(options) {
		this.options=options;
		this.days=null;
		this.selected_day=null;
		
		document.observe('dom:loaded', this.setupCalendar.bindAsEventListener(this));
		
	},
	select: function(day){
		
		if (this.selected_day != null) 
			this.selected_day.removeClassName("selected")
		
		this.selected_day=$$("td.date_day[date='" + day + "']").reduce()
		
		date=this.selected_day.addClassName("selected")
		days=date.readAttribute("date").match(/^([0-9]{4,4}-[0-9]{2})-[0-9]{2,2}$/)

		if(days && days.length > 1)
		{
			month=days[1]
			option=$$(".calendar #month_selection option[value='"+ month + "']").reduce()
			option.selected=true
			
			$$(".calendar .month.current").reduce().removeClassName("current")
			$$(".calendar .month[month="+ month + "]").reduce().addClassName("current")
			
		}
		
		
	},
	selectDay: function(e){
		if (this.selected_day) 
			this.selected_day.removeClassName("selected")

		this.selected_day=Event.element(e);		
		this.selected_day.addClassName("selected")
		
		date=this.selected_day.readAttribute("date");
		if(this.options.onSelectedDate)
			this.options.onSelectedDate(date);
		
	},
	
	setupCalendar: function() {

		this.selected_day=$$("td.date_day.selected").reduce()
		
		if(this.options.initValue)
			this.select($(this.options.initValue).value)
		
		this.month_selection=$("month_selection");
		this.month_selection.observe("change",this.selectMonth.bindAsEventListener(this))
		
		previous_obj =$$(".calendar a[method=previous]").reduce();
		next_obj =$$(".calendar a[method=next]").reduce();
		
		previous_obj.observe("click",this.previousCal.bindAsEventListener(this))
		next_obj.observe("click",this.nextCal.bindAsEventListener(this))

		
		this.days=$$(".calendar .date_day");
		for (i=0;i<this.days.length;i++){
			date = this.days[i];
			date.observe("click", this.selectDay.bindAsEventListener(this))
		}
		
		this.selected_day=$$(".calendar .date_day.selected").reduce()
		
	},
	selectMonth: function(e){
		select=Event.element(e);
		month=select.value
		$$(".calendar .month.current").reduce().removeClassName("current")
		$$(".calendar .month[month="+ month + "]").reduce().addClassName("current")
		
	},
	previousCal: function(e){
		e.stop()
		current=$$(".calendar .month.current").reduce()
		if(current && current.previous()){
			next=current.previous()
			current.removeClassName("current")
			next.addClassName("current")
	
			option=$$(".calendar #month_selection option[value=" + next.readAttribute("month") + "]").reduce()
			option.selected=true
			this.month_selection
		}
	},
	nextCal: function(e){
		e.stop()
		current=$$(".calendar .month.current").reduce()
		if(current && current.next()){
			next=current.next()
			current.removeClassName("current")
			next.addClassName("current")
			this.month_selection
			option=$$(".calendar #month_selection option[value=" + next.readAttribute("month") + "]").reduce()
			option.selected=true	
		}
	}
});