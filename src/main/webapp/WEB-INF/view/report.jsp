<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reports - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* --- stats cards --- */
        .dashboard-section { display: flex; gap: 1rem; flex-wrap: wrap; margin: 2rem 0; }
        .dashboard-card {
            flex: 1; min-width: 150px;
            background: #fff; padding: 1rem 1.5rem;
            border-radius: 8px; text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .dashboard-card h3 { margin-bottom: .5rem; color: #333; }
        .dashboard-card .number { font-size: 2rem; font-weight: bold; color: #7b5cff; }
        /* --- search & filters --- */
        .filter-section { display: flex; gap: 1rem; flex-wrap: wrap; margin: 1.5rem 0; }
        .filter-section input, .filter-section select {
            padding: .5rem 1rem; border-radius: 5px; border: 1px solid #ccc;
            font-size: 1rem; flex: 1;
        }
        /* --- cards grid --- */
        .reports-grid { display: grid; grid-template-columns: repeat(auto-fill,minmax(280px,1fr)); gap: 1rem; }
        .report-card {
            background: #fff; padding: 1rem; border-radius: 8px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.08);
            cursor: pointer; display: flex; flex-direction: column;
            transition: transform .2s;
        }
        .report-card:hover { transform: translateY(-3px); }
        .report-card-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: .75rem; }
        .report-card-title { font-weight: 600; color: #333; }
        .report-card-date { font-size: .9rem; color: #666; }
        .priority-submitted { background: #f39c12; color: #fff; padding: 2px 8px; border-radius:4px; font-size:.8rem; }
        .priority-in\ progress { /* class name with space must be escaped */ }
        .priority-in-progress { background: #3498db; color: #fff; padding:2px 8px; border-radius:4px; font-size:.8rem; }
        .priority-completed { background: #2ecc71; color: #fff; padding:2px 8px; border-radius:4px; font-size:.8rem; }
        .report-card-description { flex:1; color:#555; margin-bottom: .75rem; }
        .report-card-footer { font-size:.9rem; color:#444; display:flex; justify-content:space-between; }
    </style>
</head>
<body>
<nav>
    <%@ include file="/WEB-INF/view/widgets/navbar.jsp" %>
</nav>

<main>
    <br>
    <!-- Report New Issue Button -->
    <a href="#" class="report-new-btn" style="margin-left: 5rem">Report a new Issue</a>

    <dialog id="reportDialog" class="report-modal">
        <form id="reportForm" action="createReport" method="post" enctype="multipart/form-data" class="modal-content">
            <!-- Remove the hidden reportId field -->
            <h2>Add Report</h2>

            <label>
                Title:<br>
                <input type="text" name="title" placeholder="Enter your report title…" required>
            </label>

            <label>
                Description:<br>
                <textarea name="description" placeholder="Enter your report description…" required></textarea>
            </label>

            <label>
                Screenshot / Photo:<br>
                <input type="file" name="reportImage" accept="image/*" required>
            </label>

            <div class="modal-actions">
                <button type="button" class="btn-outline" id="cancelBtn">
                    Cancel
                </button>
                <button type="submit" class="btn-primary">
                    Submit
                </button>
            </div>
        </form>
    </dialog>
    <div class="reports-container">

        <!-- 1) Compute counts -->
        <c:set var="totalReports" value="${fn:length(reports)}" />
        <c:set var="submittedCount" value="0" />
        <c:set var="inProgressCount" value="0" />
        <c:set var="completedCount" value="0" />
        <c:forEach var="r" items="${reports}">
            <c:choose>
                <c:when test="${r.status == 'Submitted'}">
                    <c:set var="submittedCount" value="${submittedCount + 1}" />
                </c:when>
                <c:when test="${r.status == 'In Progress'}">
                    <c:set var="inProgressCount" value="${inProgressCount + 1}" />
                </c:when>
                <c:when test="${r.status == 'Completed'}">
                    <c:set var="completedCount" value="${completedCount + 1}" />
                </c:when>
            </c:choose>
        </c:forEach>

        <!-- 2) Stats Cards -->
        <div class="dashboard-section">
            <div class="dashboard-card">
                <h3>Total Reports</h3>
                <div class="number">${totalReports}</div>
            </div>
            <div class="dashboard-card">
                <h3>Pending (Submitted)</h3>
                <div class="number">${submittedCount}</div>
            </div>
            <div class="dashboard-card">
                <h3>In Progress</h3>
                <div class="number">${inProgressCount}</div>
            </div>
            <div class="dashboard-card">
                <h3>Resolved (Completed)</h3>
                <div class="number">${completedCount}</div>
            </div>
        </div>

        <!-- 3) Search & Filter -->
        <div class="filter-section">
            <input type="text" id="searchReports" placeholder="🔍 Search reports..." />
            <select id="priorityFilter">
                <option value="">All Priorities</option>
                <option value="Critical">Critical</option>
                <option value="Medium">Medium</option>
                <option value="Normal">Normal</option>
            </select>
            <select id="statusFilter">
                <option value="">All Status</option>
                <option value="Submitted">Submitted</option>
                <option value="In Progress">In Progress</option>
                <option value="Completed">Completed</option>
            </select>
        </div>

        <!-- 4) Reports Grid -->
        <div class="reports-section">
            <h2>Your <span style="color:#7b5cff">Reports</span></h2>
            <div id="reportsGrid" class="reports-grid">
                <c:forEach items="${reports}" var="report">
                    <div class="report-card"
                         data-title="${fn:toLowerCase(report.title)}"
                         data-desc="${fn:toLowerCase(report.description)}"
                         data-priority="${report.priority}"
                         data-status="${report.status}"
                         onclick="location='viewReport?id=${report.id}'">
                        <div class="report-card-header">
                            <div>
                                <div class="report-card-title">${report.title}</div>
                                <div class="report-card-date">
                                    <fmt:formatDate value="${report.createdAt}" pattern="dd MMM yyyy"/>
                                </div>
                            </div>
                            <div class="priority-${report.status.toLowerCase().replace(' ', '-')}">
                                    ${report.status}
                            </div>
                        </div>
                        <div class="report-card-description">${report.description}</div>
                        <div class="report-card-footer">
                            <div>Priority: ${report.priority}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>

<footer>
    <%@ include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>

<script>
    const searchInput    = document.getElementById('searchReports');
    const priorityFilter = document.getElementById('priorityFilter');
    const statusFilter   = document.getElementById('statusFilter');
    const cards          = document.querySelectorAll('#reportsGrid .report-card');

    function filterCards() {
        const term     = searchInput.value.trim().toLowerCase();
        const prio     = priorityFilter.value;
        const status   = statusFilter.value;

        cards.forEach(card => {
            const title    = card.dataset.title;
            const desc     = card.dataset.desc;
            const cardPrio = card.dataset.priority;
            const cardSt   = card.dataset.status;

            const matchesSearch = !term || title.includes(term) || desc.includes(term);
            const matchesPrio   = !prio || cardPrio === prio;
            const matchesSt     = !status || cardSt === status;

            card.style.display = (matchesSearch && matchesPrio && matchesSt)
                ? 'flex' : 'none';
        });
    }
    const btn  = document.querySelector('.report-new-btn');
    const dialog = document.getElementById('reportDialog');
    const openBtn    = document.querySelector('.report-new-btn');
    const cancelBtn  = document.getElementById('cancelBtn');
    const form       = document.getElementById('reportForm');
    const feedbackEl = document.getElementById('uploadFeedback');

    // Open modal
    btn.addEventListener('click', e => {
        e.preventDefault();
        dialog.showModal();
    });

    // Close on Cancel (value="cancel") or clicking outside
    dialog.addEventListener('cancel', () => dialog.close());
    dialog.addEventListener('click', e => {
        // if backdrop clicked
        const rect = dialog.getBoundingClientRect();
        if (
            e.clientX < rect.left ||
            e.clientX > rect.right ||
            e.clientY < rect.top ||
            e.clientY > rect.bottom
        ) {
            dialog.close();
        }
    });

    // 2. Cancel button closes
    cancelBtn.addEventListener('click', () => dialog.close());

    [searchInput, priorityFilter, statusFilter]
        .forEach(el => el.addEventListener('input', filterCards));
</script>
</body>
</html>
