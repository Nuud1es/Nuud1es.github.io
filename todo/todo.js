// Shared helpers for the public and admin todo pages.
const STATUSES = {
  suggested:   "Suggested",
  accepted:    "Accepted",
  in_progress: "In progress",
  blocked:     "Blocked",
  done:        "Done",
  declined:    "Declined"
};

function getClient() {
  const cfg = window.TODO_CONFIG;
  if (!cfg || cfg.supabaseUrl.includes("YOUR-PROJECT")) return null;
  return window.supabase.createClient(cfg.supabaseUrl, cfg.supabaseAnonKey);
}

function el(tag, props = {}, ...children) {
  const node = document.createElement(tag);
  for (const [k, v] of Object.entries(props)) {
    if (k === "class") node.className = v;
    else if (k.startsWith("on")) node.addEventListener(k.slice(2), v);
    else node.setAttribute(k, v);
  }
  for (const c of children) node.append(c);
  return node;
}

function formatDate(value) {
  if (!value) return "";
  return new Date(value).toLocaleDateString("en-GB", { day: "numeric", month: "short", year: "numeric" });
}

function statusBadge(status) {
  return el("span", { class: `badge badge-${status}` }, STATUSES[status] || status);
}

function etaLabel(task) {
  if (!task.eta) return "";
  const overdue = task.status !== "done" && task.status !== "declined" &&
    new Date(task.eta + "T23:59:59") < new Date();
  return el("span", { class: overdue ? "eta overdue" : "eta" }, `ETA ${formatDate(task.eta)}`);
}
