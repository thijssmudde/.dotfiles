// Test TypeScript file for verifying configuration
interface User {
  id: number;
  name: string;
  email: string;
  createdAt: Date;
}

class UserService {
  private users: User[] = [];

  constructor() {
    this.users = [];
  }

  addUser(user: User): void {
    this.users.push(user);
  }

  getUserById(id: number): User | undefined {
    return this.users.find(user => user.id === id);
  }

  getAllUsers(): User[] {
    return this.users;
  }

  updateUser(id: number, updates: Partial<User>): boolean {
    const userIndex = this.users.findIndex(user => user.id === id);
    if (userIndex === -1) return false;
    
    this.users[userIndex] = { ...this.users[userIndex], ...updates };
    return true;
  }
}

// Test async/await and promises
async function fetchUserData(userId: number): Promise<User> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve({
        id: userId,
        name: `User ${userId}`,
        email: `user${userId}@example.com`,
        createdAt: new Date()
      });
    }, 1000);
  });
}

// Test generics
function identity<T>(arg: T): T {
  return arg;
}

// Test type unions and type guards
type Status = 'active' | 'inactive' | 'pending';

function processStatus(status: Status): string {
  switch (status) {
    case 'active':
      return 'User is active';
    case 'inactive':
      return 'User is inactive';
    case 'pending':
      return 'User is pending';
    default:
      const _exhaustive: never = status;
      return _exhaustive;
  }
}

// Test decorators (if enabled)
function log(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
  const originalMethod = descriptor.value;
  descriptor.value = function(...args: any[]) {
    console.log(`Calling ${propertyKey} with args:`, args);
    return originalMethod.apply(this, args);
  };
  return descriptor;
}

// Test JSX/TSX support
type ButtonProps = {
  label: string;
  onClick: () => void;
  disabled?: boolean;
};

const Button: React.FC<ButtonProps> = ({ label, onClick, disabled = false }) => {
  return (
    <button onClick={onClick} disabled={disabled}>
      {label}
    </button>
  );
};

export { UserService, fetchUserData, identity, processStatus, Button };