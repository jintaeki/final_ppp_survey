<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="resources/css/surveyresult.css">
<script src="resources/js/surveyresult.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/hierarchy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>


<div class="container">
	<div class="row">
		<div class="col-1">항목</div>
		<div class="col-2" style="font-size: 90%; width: 100px">22년도 4분기 다면평가</div>
		<div class="col-1">기간</div>
		<div class="col-2" style="font-size: 90%">2022.10.01 - 2022.12.31</div>
		<div class="col-1">부서</div>
		<div class="col-2">사업지원팀</div>
		<div class="col-1">소속</div>
		<div class="col-2">1팀</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-1">${name}</div>
		<div class="col-2" style="font-size: 90%; width: 100px">22년도 4분기 다면평가</div>
		<div class="col-1">기간</div>
		<div class="col-2" style="font-size: 90%">2022.10.01 - 2022.12.31</div>
		<div class="col-1">부서</div>
		<div class="col-2">사업지원팀</div>
		<div class="col-1">소속</div>
		<div class="col-2">1팀</div>
	</div>
</div>
<div class="graph">
<div class="bar_chart">
  <canvas id="resultChart"></canvas>
</div>

<div id="circle_chart"></div>
</div>

<script>
  const ctx = document.getElementById('resultChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['1팀', '2팀', '3팀', '4팀', '5팀', '6팀'],
      datasets: [{
        label: '2022년 4분기 전체 다면평가',
        data: [14, 11, 9, 12, 8, 15],
        borderWidth: 1
      }]
  
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  
  /* 성격 장단점 */
  am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("circle_chart");

// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);

var data = {
  value: 0,
  children: []
}

for (var i = 0; i < 6; i++) {
  data.children.push({ name: "성격 " + i, value: Math.random() * 20 + 1 })
}

// Create wrapper container
var container = root.container.children.push(
  am5.Container.new(root, {
    width: am5.percent(100),
    height: am5.percent(100),
    layout: root.verticalLayout
  })
);

// Create series
var series = container.children.push(
  am5hierarchy.ForceDirected.new(root, {
    singleBranchOnly: false,
    downDepth: 2,
    topDepth: 1,
    initialDepth: 1,
    maxRadius: 60,
    minRadius: 20,
    valueField: "value",
    categoryField: "name",
    childDataField: "children",
    manyBodyStrength: -13,
    centerStrength: 0.8
  })
);

series.get("colors").setAll({
  step: 1
});

series.links.template.setAll({
  strokeWidth: 2
});

series.nodes.template.setAll({
  tooltipText: null,
  cursorOverStyle: "pointer"
});

var selectedDataItem;

// handle clicking on nodes and link/unlink them
series.nodes.template.events.on("click", function(e) {
  // check if we have a selected data item
  if (selectedDataItem) {
    var targetDataItem = e.target.dataItem;
    // if yes, and it's the same, unselect
    if (e.target.dataItem == selectedDataItem) {
      selectedDataItem.get("outerCircle").setPrivate("visible", false);
      selectedDataItem = undefined;
    }
    // otherwise connect selected with a clicked point
    else {
      if (series.areLinked(selectedDataItem, targetDataItem)) {
        series.unlinkDataItems(selectedDataItem, targetDataItem);
      }
      else {
        series.linkDataItems(selectedDataItem, targetDataItem, 0.2);
      }
    }
  }
  // if no selected data item, select
  else {
    selectedDataItem = e.target.dataItem;
    selectedDataItem.get("outerCircle").setPrivate("visible", true)
  }
})

series.data.setAll([data]);
series.set("selectedDataItem", series.dataItems[0]);

// Make stuff animate on load
series.appear(500, 100);

}); // end am5.ready()
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>