1)unit
import React, { useEffect, useState } from "react";
import {
  TrendingUp,
  Users,
  Home,
  Settings,
  Grid3X3,
  Search,
  Power,
  MoreHorizontal,
  Zap,
  ZapOff,
} from "lucide-react";

// Navigation Item Component (shared with Dashboard)
function NavItem({
  icon: Icon,
  label,
  isActive = false,
}: {
  icon: any;
  label: string;
  isActive?: boolean;
}) {
  return (
    <div
      className={`flex items-center gap-3 px-4 py-3 rounded-lg cursor-pointer transition-all duration-200 ${
        isActive
          ? "bg-primary text-primary-foreground shadow-sm"
          : "text-muted-foreground hover:text-foreground hover:bg-accent"
      }`}
    >
      <Icon className="h-5 w-5" />
      <span className="font-medium">{label}</span>
    </div>
  );
}

// Sidebar Component (shared with Dashboard)
function Sidebar() {
  return (
    <div className="w-64 bg-card border-r border-border h-full flex flex-col">
      <div className="p-6 border-b border-border">
        <h1 className="text-xl font-bold text-foreground">Tenanto System</h1>
        <p className="text-sm text-muted-foreground mt-1">Property Management</p>
      </div>

      <nav className="flex-1 p-4 space-y-2">
        <NavItem icon={Grid3X3} label="Dashboard" />
        <NavItem icon={Home} label="Units" isActive />
        <NavItem icon={Users} label="Tenants" />
        <NavItem icon={Settings} label="Settings" />
      </nav>
    </div>
  );
}

// Stats Card Component
function StatsCard({ title, value, color }: { title: string; value: number; color: string }) {
  return (
    <div className="relative overflow-hidden bg-card border border-border rounded-lg shadow-sm">
      <div className="p-6">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-sm font-medium text-muted-foreground">{title}</p>
            <p className="text-3xl font-bold mt-2">{value}</p>
          </div>
        </div>
      </div>
      <div className={`absolute top-0 right-0 w-1 h-full ${color}`} />
    </div>
  );
}

// Status Badge Component
function StatusBadge({ status }: { status: string }) {
  const getStatusColor = (status: string) => {
    switch (status.toLowerCase()) {
      case "paid":
        return "bg-green-100 text-green-800 border-green-200 dark:bg-green-900/20 dark:text-green-400 dark:border-green-800";
      case "overdue":
        return "bg-red-100 text-red-800 border-red-200 dark:bg-red-900/20 dark:text-red-400 dark:border-red-800";
      case "vacant":
        return "bg-gray-100 text-gray-800 border-gray-200 dark:bg-gray-900/20 dark:text-gray-400 dark:border-gray-800";
      default:
        return "bg-blue-100 text-blue-800 border-blue-200 dark:bg-blue-900/20 dark:text-blue-400 dark:border-blue-800";
    }
  };

  return (
    <span
      className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium border ${getStatusColor(
        status
      )}`}
    >
      {status}
    </span>
  );
}

// Power Control Component
function PowerControl({
  isOn,
  unitId,
  togglePower,
}: {
  isOn: boolean;
  unitId: string;
  togglePower: () => void;
}) {
  return (
    <div className="flex items-center gap-2">
      <div
        className={`flex items-center gap-1 px-2 py-1 rounded-md text-xs font-medium ${
          isOn
            ? "bg-green-100 text-green-800 dark:bg-green-900/20 dark:text-green-400"
            : "bg-red-100 text-red-800 dark:bg-red-900/20 dark:text-red-400"
        }`}
      >
        {isOn ? <Zap className="h-3 w-3" /> : <ZapOff className="h-3 w-3" />}
        {isOn ? "ON" : "OFF"}
      </div>
      <button
        onClick={togglePower}
        className="p-1 hover:bg-accent rounded-md transition-colors"
        title={`Turn ${isOn ? "off" : "on"} power for ${unitId}`}
      >
        <Power className="h-4 w-4 text-muted-foreground" />
      </button>
    </div>
  );
}

// Assign Tenant Form Component
function AssignTenantForm({
  unitId,
  onClose,
  onAssign,
}: {
  unitId: string;
  onClose: () => void;
  onAssign: (tenantData: {
    tenant: string;
    mobile: string;
    rent: number;
    startDate: string;
    duration: string;
  }) => void;
}) {
  const [tenant, setTenant] = useState("");
  const [mobile, setMobile] = useState("");
  const [rent, setRent] = useState("");
  const [startDate, setStartDate] = useState("");
  const [duration, setDuration] = useState("1 month");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!tenant || !mobile || !rent || !startDate) {
      alert("Please fill all fields");
      return;
    }
    onAssign({
      tenant,
      mobile,
      rent: Number(rent),
      startDate,
      duration,
    });
    onClose();
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <form
        onSubmit={handleSubmit}
        className="bg-white rounded-lg p-6 w-96 space-y-4 shadow-lg"
      >
        <h3 className="text-xl font-bold mb-2">Assign Tenant to {unitId}</h3>

        <div>
          <label className="block mb-1 font-medium">Tenant Name</label>
          <input
            type="text"
            value={tenant}
            onChange={(e) => setTenant(e.target.value)}
            className="w-full border border-border rounded px-3 py-2"
            required
          />
        </div>

        <div>
          <label className="block mb-1 font-medium">Tenant Mobile</label>
          <input
            type="tel"
            value={mobile}
            onChange={(e) => setMobile(e.target.value)}
            className="w-full border border-border rounded px-3 py-2"
            required
          />
        </div>

        <div>
          <label className="block mb-1 font-medium">Rent Amount</label>
          <input
            type="number"
            min={0}
            value={rent}
            onChange={(e) => setRent(e.target.value)}
            className="w-full border border-border rounded px-3 py-2"
            required
          />
        </div>

        <div>
          <label className="block mb-1 font-medium">Starting Date</label>
          <input
            type="date"
            value={startDate}
            onChange={(e) => setStartDate(e.target.value)}
            className="w-full border border-border rounded px-3 py-2"
            required
          />
        </div>

        <div>
          <label className="block mb-1 font-medium">Duration</label>
          <select
            value={duration}
            onChange={(e) => setDuration(e.target.value)}
            className="w-full border border-border rounded px-3 py-2"
          >
            <option>1 month</option>
            <option>7 days</option>
          </select>
        </div>

        <div className="flex justify-end gap-2 pt-4 border-t border-border">
          <button
            type="button"
            onClick={onClose}
            className="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400"
          >
            Cancel
          </button>
          <button
            type="submit"
            className="px-4 py-2 rounded bg-primary text-primary-foreground hover:bg-primary/90"
          >
            Assign Tenant
          </button>
        </div>
      </form>
    </div>
  );
}

// Units Table Component with props for units and setUnits
function UnitsTable({
  units,
  setUnits,
  onAssignClick,
}: {
  units: Array<{ id: string; tenant: string; status: string; grace: string; power: boolean }>;
  setUnits: React.Dispatch<
    React.SetStateAction<
      Array<{ id: string; tenant: string; status: string; grace: string; power: boolean }>
    >
  >;
  onAssignClick: (unitId: string) => void;
}) {
  // Toggle power for a unit
  const togglePower = (unitId: string) => {
    const updatedUnits = units.map((unit) =>
      unit.id === unitId ? { ...unit, power: !unit.power } : unit
    );
    setUnits(updatedUnits);
    localStorage.setItem("units", JSON.stringify(updatedUnits));
  };

  // Calculate stats for display
  const totalUnits = units.length;
  const occupiedUnits = units.filter((u) => u.tenant.toLowerCase() !== "vacant").length;
  const emptyUnits = totalUnits - occupiedUnits;

  return (
    <>
      {/* Update stats dynamically */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
        <StatsCard title="No of Units" value={totalUnits} color="bg-blue-500" />
        <StatsCard title="Occupied" value={occupiedUnits} color="bg-green-500" />
        <StatsCard title="Empty" value={emptyUnits} color="bg-yellow-500" />
      </div>

      <div className="bg-card border border-border rounded-lg shadow-sm overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-muted/50 border-b border-border">
              <tr>
                <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">
                  Unit
                </th>
                <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">
                  Tenant Name
                </th>
                <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">
                  Status
                </th>
                <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">
                  Grace
                </th>
                <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">
                  Power
                </th>
                <th className="px-6 py-4 text-left text-sm font-medium text-muted-foreground">
                  Action
                </th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border">
              {units.length === 0 ? (
                <tr>
                  <td colSpan={6} className="text-center py-6 text-muted-foreground italic">
                    No units found.
                  </td>
                </tr>
              ) : (
                units.map((unit, index) => (
                  <tr key={index} className="hover:bg-muted/50 transition-colors">
                    <td className="px-6 py-4">
                      <span className="font-medium">{unit.id}</span>
                    </td>
                    <td className="px-6 py-4">
                      <span
                        className={
                          unit.tenant.toLowerCase() === "vacant" ? "text-muted-foreground italic" : ""
                        }
                      >
                        {unit.tenant}
                      </span>
                    </td>
                    <td className="px-6 py-4">
                      <StatusBadge status={unit.status} />
                    </td>
                    <td className="px-6 py-4">
                      <span className="text-sm text-muted-foreground">{unit.grace}</span>
                    </td>
                    <td className="px-6 py-4">
                      <PowerControl
                        isOn={unit.power}
                        unitId={unit.id}
                        togglePower={() => togglePower(unit.id)}
                      />
                    </td>
                    <td className="px-6 py-4 flex gap-2">
                      <button className="p-2 hover:bg-accent rounded-md transition-colors">
                        <MoreHorizontal className="h-4 w-4 text-muted-foreground" />
                      </button>
                      {/* Add button to assign tenant */}
                      <button
                        onClick={() => onAssignClick(unit.id)}
                        className="p-2 hover:bg-accent rounded-md transition-colors text-sm text-blue-600"
                      >
                        ...
                      </button>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </>
  );
}

// Search Component
function SearchBar() {
  return (
    <div className="relative max-w-md">
      <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
      <input
        type="text"
        placeholder="Search tenant name..."
        className="pl-10 pr-4 py-2 w-full border border-border rounded-lg bg-background text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:border-transparent"
      />
    </div>
  );
}

// Main Units Component
export function Units() {
  // Move units state here to be accessible by controls and table
  const [units, setUnits] = useState<
    Array<{ id: string; tenant: string; status: string; grace: string; power: boolean }>
  >([]);

  // Manage modal state
  const [assignModalOpen, setAssignModalOpen] = useState(false);
  const [selectedUnit, setSelectedUnit] = useState<string>("");

  useEffect(() => {
    const storedUnits = localStorage.getItem("units");
    if (storedUnits) {
      try {
        const parsedUnits = JSON.parse(storedUnits);
        setUnits(parsedUnits);
      } catch (error) {
        console.error("Failed to parse units from localStorage", error);
        setUnits([]);
      }
    } else {
      setUnits([]);
    }
  }, []);

  // Turn on all units
  const turnOnAll = () => {
    const updated = units.map((u) => ({ ...u, power: true }));
    setUnits(updated);
    localStorage.setItem("units", JSON.stringify(updated));
  };

  // Turn off all units
  const turnOffAll = () => {
    const updated = units.map((u) => ({ ...u, power: false }));
    setUnits(updated);
    localStorage.setItem("units", JSON.stringify(updated));
  };

  // Open advanced settings (example)
  const openAdvancedSettings = () => {
    alert("Advanced settings clicked!");
  };

  // Handle assign tenant button click (open modal)
  const handleAssignClick = (unitId: string) => {
    setSelectedUnit(unitId);
    setAssignModalOpen(true);
  };

  // Handle assign tenant form submit
  const handleAssignTenant = (tenantData: {
    tenant: string;
    mobile: string;
    rent: number;
    startDate: string;
    duration: string;
  }) => {
    // Update the units state with new tenant info for the selected unit
    const updatedUnits = units.map((unit) => {
      if (unit.id === selectedUnit) {
        return {
          ...unit,
          tenant: tenantData.tenant,
          status: "paid", // or set according to logic
          grace: tenantData.duration,
          power: true, // maybe power on when assigned tenant?
        };
      }
      return unit;
    });
    setUnits(updatedUnits);
    localStorage.setItem("units", JSON.stringify(updatedUnits));
  };

  return (
    <div className="flex h-screen bg-background">
      <Sidebar />

      <main className="flex-1 overflow-auto">
        <div className="p-6 space-y-6">
          {/* Header */}
          <div>
            <h2 className="text-2xl font-bold text-foreground">Units Management</h2>
            <p className="text-muted-foreground">Monitor and control your property units</p>
          </div>

          {/* Search Bar and Add Unit Button */}
          <div className="flex justify-between items-center">
            <SearchBar />
            <button className="px-4 py-2 bg-primary text-primary-foreground rounded-lg hover:bg-primary/90 transition-colors">
              Add Unit
            </button>
          </div>

          {/* Units Table */}
          <UnitsTable units={units} setUnits={setUnits} onAssignClick={handleAssignClick} />

          {/* IoT Control Panel */}
          <div className="bg-card border border-border rounded-lg shadow-sm mb-6">
            <div className="p-4 border-b border-border">
              <h3 className="text-lg font-semibold">Quick IoT Controls</h3>
              <p className="text-sm text-muted-foreground">Bulk control for all units</p>
            </div>
            <div className="p-4">
              <div className="flex gap-3">
                <button
                  onClick={turnOnAll}
                  className="flex items-center gap-2 px-4 py-2 bg-green-100 text-green-800 dark:bg-green-900/20 dark:text-green-400 rounded-lg hover:bg-green-200 dark:hover:bg-green-900/40 transition-colors"
                >
                  <Zap className="h-4 w-4" />
                  Turn ON all units
                </button>
                <button
                  onClick={turnOffAll}
                  className="flex items-center gap-2 px-4 py-2 bg-red-100 text-red-800 dark:bg-red-900/20 dark:text-red-400 rounded-lg hover:bg-red-200 dark:hover:bg-red-900/40 transition-colors"
                >
                  <ZapOff className="h-4 w-4" />
                  Turn OFF all units
                </button>
                <button
                  onClick={openAdvancedSettings}
                  className="flex items-center gap-2 px-4 py-2 bg-accent text-foreground rounded-lg hover:bg-accent/90 transition-colors"
                >
                  <Settings className="h-4 w-4" />
                  Advanced Settings
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* Assign Tenant Modal */}
        {assignModalOpen && (
          <AssignTenantForm
            unitId={selectedUnit}
            onClose={() => setAssignModalOpen(false)}
            onAssign={handleAssignTenant}
          />
        )}
      </main>
    </div>
  );
}


2)unit
import React, { useState } from "react";
import { Card } from "./ui/card";
import { Input } from "./ui/input";
import { Button } from "./ui/button";

export default function AddUnit() {
  const [unitName, setUnitName] = useState("");
  const [successMsg, setSuccessMsg] = useState("");

  const handleAdd = () => {
    if (!unitName.trim()) {
      alert("Unit name is required");
      return;
    }

    // Step 1: Get existing units
    const stored = localStorage.getItem("units");
    let units = [];
    if (stored) {
      try {
        units = JSON.parse(stored);
      } catch (e) {
        console.error("Invalid data in localStorage");
      }
    }

    // Step 2: Add new unit
    const newUnit = {
      id: unitName,
      tenant: "Vacant",
      status: "Vacant",
      grace: "-",
      power: false
    };

    const updatedUnits = [...units, newUnit];

    // Step 3: Save back to localStorage
    localStorage.setItem("units", JSON.stringify(updatedUnits));

    // Step 4: Reset input + show success
    setUnitName("");
    setSuccessMsg(`Unit "${unitName}" added successfully!`);

    // Auto-clear success message after 3s
    setTimeout(() => setSuccessMsg(""), 3000);
  };

  return (
    <div className="p-4 md:p-8">
      <h2 className="text-xl font-semibold mb-4">Add Unit</h2>

      <Card className="w-full max-w-xl space-y-4 p-6">
        <Input
          placeholder="Enter unit name"
          value={unitName}
          onChange={(e) => setUnitName(e.target.value)}
        />
        <Button onClick={handleAdd}>Add Unit</Button>

        {successMsg && (
          <p className="text-green-600 text-sm">{successMsg}</p>
        )}
      </Card>
    </div>
  );
}

3)
addunit)
import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import Dashboard from "./components/Dashboard";
import { Units } from "./components/Units";
import TenantDetails from "./components/TenantDetails";
import AssignTenant from "./components/AssignTenant";
import AddUnit from "./components/AddUnit";

function App() {
  return (
    <Router>
      <div className="min-h-screen flex">
        <aside className="w-64 bg-gray-100 p-4 hidden md:block">
          <h1 className="text-lg font-bold mb-6">Tenanto system</h1>
          <nav className="space-y-2">
            <Link to="/" className="block">Dashboard</Link>
            <Link to="/units" className="block">Units</Link>
            <Link to="/tenant-details" className="block">Tenant Details</Link>
            <Link to="/assign-tenant" className="block">Assign Tenant</Link>
            <Link to="/add-unit" className="block">Add Unit</Link>
          </nav>
        </aside>
        <main className="flex-1 p-4">
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/units" element={<Units />} />
            <Route path="/tenant-details" element={<TenantDetails />} />
            <Route path="/assign-tenant" element={<AssignTenant />} />
            <Route path="/add-unit" element={<AddUnit />} />
          </Routes>
        </main>
      </div>
    </Router>
  );
}

export default App;

